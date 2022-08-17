require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UnicoNorteApi
  class Application < Rails::Application

    config.load_defaults 7.0

    config.api_only = true

    Notion.configure do |config|
      config.token = ENV['NOTION_API_TOKEN']
    end
    
  end
end
