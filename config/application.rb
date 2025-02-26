require_relative "boot"

require "rails"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module RailsWithAuth
  class Application < Rails::Application
    config.load_defaults 8.0

    config.active_record.schema_format = :sql
  end
end
