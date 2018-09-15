require_relative 'boot'

require 'rails/all'

#require "#{Rails.root}\app\pdf\Ausleihformular.rb"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fs06msv1
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths << "#{config.root}/app/assets/pdfs"
    require "#{Rails.root}/app/assets/pdfs/invetarPDF.rb"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
