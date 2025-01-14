# frozen_string_literal: true

enabled         = ENV['ES_ENABLED'] == 'true'
host            = ENV.fetch('ES_HOST') { 'localhost' }
port            = ENV.fetch('ES_PORT') { 9200 }
user            = ENV.fetch('ES_USER') { nil }
password        = ENV.fetch('ES_PASS') { nil }
fallback_prefix = ENV.fetch('REDIS_NAMESPACE') { nil }
prefix          = ENV.fetch('ES_PREFIX') { fallback_prefix }

Chewy.settings = {
  host: "#{host}:#{port}",
  prefix: prefix,
  enabled: enabled,
  journal: false,
  user: user,
  password: password,
  index: {
    number_of_replicas: ['single_node_cluster', nil].include?(ENV['ES_PRESET'].presence) ? 0 : 1,
  },
}

# We use our own async strategy even outside the request-response
# cycle, which takes care of checking if Elasticsearch is enabled
# or not. However, mind that for the Rails console, the :urgent
# strategy is set automatically with no way to override it.
Chewy.root_strategy              = :bypass_with_warning if Rails.env.production?
Chewy.request_strategy           = :mastodon
Chewy.use_after_commit_callbacks = false

# Elasticsearch uses Faraday internally. Faraday interprets the
# http_proxy env variable by default which leads to issues when
# Mastodon is run with hidden services enabled, because
# Elasticsearch is *not* supposed to be accessed through a proxy
Faraday.ignore_env_proxy = true

