# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'dry-struct'
gem 'faraday', '~> 2.7'
gem 'faraday-multipart', '~> 1.0'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8'
gem 'rubocop', require: false
gem 'slim-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug', '~> 3.0'
  gem 'pry-rails', '~> 0.1'
  gem 'rspec-rails', '~> 6.0'
end

group :development do
  gem 'rubocop-faker', '~> 1.0'
  gem 'rubocop-performance', '~> 1.0'
  gem 'rubocop-rails', '~> 2.0'
  gem 'rubocop-rspec', '~> 2.0'
  gem 'web-console'
end

group :test do
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
  gem 'webmock'
end
