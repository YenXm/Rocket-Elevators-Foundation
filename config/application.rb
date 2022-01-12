# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module App
    class Application < Rails::Application
        # Initialize configuration defaults for originally generated Rails version.
        # config.load_defaults 5.2
        

        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration can go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded after loading
        # the framework and any gems in your application

        config.before_configuration do
            env_file = File.join(Rails.root, 'config', 'local_env.yml')
            YAML.load(File.open(env_file)).each { |key, value| ENV[key.to_s] = value } if File.exists?(env_file)
        end

        Bundler.require(*Rails.groups)
        if ['development', 'test'].include? ENV['RAILS_ENV']
            Dotenv::Railtie.load
        end
        config.eager_load_paths << Rails.root.join('lib')
        # config.force_ssl = true
    end
end
