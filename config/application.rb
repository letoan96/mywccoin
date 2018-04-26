require_relative 'boot'
require 'geokit'
require 'timezone'
require 'rails/all'
require 'active_support'
require 'active_support/time'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WCCoin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :sidekiq
    
    middleware.use ::ActionDispatch::Static, "#{Rails.root}/build"
  end
end
