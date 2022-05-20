# frozen_string_literal: true

#redis_connection = Redis.new(
#  url: ENV['REDIS_URL'],
#)

#namespace = ENV.fetch('REDIS_NAMESPACE') { nil }

#if namespace
#  Redis.current = Redis::Namespace.new(namespace, redis: redis_connection)
#else
#  Redis.current = redis_connection
#end

#redis = { db: 4, url: 'redis://localhost:6379/0' }

#Sidekiq.configure_client do |config|
#  config.redis = redis
#end

#Sidekiq.configure_server do |config|
#  config.redis = redis
#end

#ss = begin
#    Sidekiq::ScheduledSet.new
#  rescue
#    sleep 0.5
#    Sidekiq::ScheduledSet.new
#end
