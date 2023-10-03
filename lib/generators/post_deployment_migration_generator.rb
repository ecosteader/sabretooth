# frozen_string_literal: true
#
# add topline as 'module Rails' if removing last dir active_record


require 'rails/generators/active_record'

class PostDeploymentMigrationGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  include Rails::Generators::Migration

  def create_post_deployment_migration
    migration_template 'migration.erb', "db/post_migrate/#{file_name}.rb"
  end

    def migration_class_name
      file_name.camelize
    end

  def self.next_migration_number(path)
    ActiveRecord::Generators::Base.next_migration_number(path)
  end
end
