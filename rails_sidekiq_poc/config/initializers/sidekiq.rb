Sidekiq.configure_server do |config|
  config.redis = { namespace: 'poc' }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'poc' }
end