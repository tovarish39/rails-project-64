# frozen_string_literal: true

Sentry.init do |config|
  config.enabled_environments = %w[production]

  config.dsn = 'https://5ae04e3b987e127845463f9a482689b0@o4506834751651840.ingest.sentry.io/4506834753880064'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 1.0
  # or
  #   config.traces_sampler = lambda do |_context|
  #     true
  #   end
end

# example for testing errors.
# Sentry.capture_message('test message')
