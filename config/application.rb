require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ExampleAppointments
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    #partial regular expression constants:
    
    $RE_SIMPLE_DATETIME = /\A[0-9\/]+\s[0-9:]+\z/
    $RE_SIMPLE_NAME = /\A(\w+)(\s+\w+)*\z/
    $RE_SIMPLE_COMMENT = /(\A(\w+)(\s+\w+)*\z)*/
    $RE_SIMPLE_CSV_LINE = /\A([0-9\/]+\s[0-9:]+),([0-9\/]+\s[0-9:]+),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?(,)*\z/
    $RE_SIMPLE_CSV_HEADER = /\A((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z/
    $RE_SIMPLE_CSV_CONTENT = /(\A((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z)?(\A([0-9\/]+\s[0-9:]+),([0-9\/]+\s[0-9:]+),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*),((\w+)(\s+\w+)*)?\z)+/
    
    # config.secret_key_base = ENV['SecretKeyBase'].to_s
    config.secret_key_base = '1f499ab9a8bed641b237f02f561309c0326138bb70'
    # See "https://github.com/rails-api/rails-api/issues/72":
=begin
    config.secret_key_base = Object.new.tap do |o|
      def o.to_str
        fail "secret key base not set for this application"
      end
    end
=end
  end
end