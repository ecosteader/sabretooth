# frozen_string_literal: true



# frozen_string_literal: true

require_relative '../../lib/mastodon/sidekiq_middleware'

Sidekiq.configure_server do |config|
  config.redis = REDIS_CACHE_PARAMS

  config.server_middleware do |chain|
    chain.add Mastodon::SidekiqMiddleware
  end

  config.server_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Server
  end

  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end

  SidekiqUniqueJobs::Server.configure(config)
end

Sidekiq.configure_client do |config|
  config.redis = REDIS_CACHE_PARAMS

  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
end

Sidekiq.logger.level = ::Logger.const_get(ENV.fetch('RAILS_LOG_LEVEL', 'info').upcase.to_s)

SidekiqUniqueJobs.configure do |config|
  config.reaper          = :ruby
  config.reaper_count    = 1000
  config.reaper_interval = 600
  config.reaper_timeout  = 150
  config.lock_ttl        = 50.days.to_i
end




#namespace    = ENV.fetch('REDIS_NAMESPACE') { nil }
#redis_params = { url: ENV['REDIS_URL'] }

#if namespace
#  redis_params[:namespace] = namespace
#end

#Sidekiq.configure_server do |config|
#  config.redis = redis_params

#  config.server_middleware do |chain|
#    chain.add SidekiqErrorHandler
#  end

#  config.death_handlers << lambda do |job, _ex|
#    digest = job['lock_digest']
#    SidekiqUniqueJobs::Digests.delete_by_digest(digest) if digest
#  end
#end

# Sidekiq.configure_client do |config|
#  config.redis = redis_params
#end

# Sidekiq.logger.level = ::Logger.const_get(ENV.fetch('RAILS_LOG_LEVEL', 'info').upcase.to_s)
