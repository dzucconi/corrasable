require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Corrasable
  class Application < Rails::Application
    config.autoload_paths += %W(
      #{config.root}/lib
      #{config.root}/app/serializers
    )

    config.encoding = 'utf-8'

    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
  end
end
