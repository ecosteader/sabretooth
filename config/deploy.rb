# frozen_string_literal: true

lock '3.17.3'

set :repo_url, ENV.fetch('REPO', 'https://github.com/ecosteader/mastodon.git')
set :branch, ENV.fetch('BRANCH', 'main')

set :application, 'mastodon'
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :migration_role, :app

append :linked_files, '.env.production', 'public/robots.txt'
append :linked_dirs, 'vendor/bundle', 'node_modules', 'public/system'

require "bundler/capistrano"

#server "50.116.55.80", :web, :app, :db, primary: true
server "172.232.186.127", :web, :app, :db, primary: true


#set :application, "spacemin"
set :user, "hub"
set :deploy_to, "/home/hub/public/ecosteader.com/public/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :shared_children, shared_children + %w{public/uploads}

# 198 linode config
# set :default_environment, { 'PATH' => "/home/hub/.rbenv/versions/1.9.3-p194/bin:$PATH" }
# default_environment['GEM_PATH']= '/home/hub/.gem/ruby/1.9.1'
# set :default_environment, {
#      'PATH' => "home/hub/.rbenv/versions/1.9.3-p194/bin:$PATH"
#    }
#

# 50 linode config
 default_environment['PATH'] = '/home/hub/.rbenv/versions/1.9.3-p194/bin:$PATH'
 default_environment['GEM_PATH']= '/home/hub/.gem/ruby/1.9.1'
# 

set :scm, "git"
set :repository, "git@github.com:indie/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  task :start do; end
  task :stop do; end
  task :restart, roles: :app, except: {no_release: true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/apache.conf /etc/apache2/sites-available/#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end

  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
 
 # added deploy:symlink_uploads so that capistano doesn't overwrite the uploads dire every deploy
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"


namespace :systemd do
  %i[sidekiq streaming web].each do |service|
    %i[reload restart status].each do |action|
      desc "Perform a #{action} on #{service} service"
      task "#{service}:#{action}".to_sym do
        on roles(:app) do
          # runs e.g. "sudo restart mastodon-sidekiq.service"
          sudo :systemctl, action, "#{fetch(:application)}-#{service}.service"
        end
      end
    end
  end
end













after 'deploy:publishing', 'systemd:web:reload'
after 'deploy:publishing', 'systemd:sidekiq:restart'
after 'deploy:publishing', 'systemd:streaming:restart'
