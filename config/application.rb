require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IpttuWebsite
  class Application < Rails::Application
    ActsAsTaggableOn.force_lowercase = true
  end
end
