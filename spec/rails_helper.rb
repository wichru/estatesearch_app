# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'dry-struct'
require 'rspec/rails'
require 'faker'
require 'slim-rails'
require 'view_component/test_helpers'

abort('The Rails environment is running in production mode!') if Rails.env.production?

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.include ViewComponent::TestHelpers, type: :component
  config.include FactoryBot::Syntax::Methods
  config.include TestHelpers::CoreHelper
  config.include TestHelpers::ClientsHelper
end
