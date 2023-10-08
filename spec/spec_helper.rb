# frozen_string_literal: true

require 'capybara/rspec'
require 'rails_helper'
require 'webmock/rspec'
require 'selenium-webdriver'

browser_width = 1440
browser_height = 900
javascript_driver = :headless_chrome
allow = ['127.0.0.1']

WebMock.disable_net_connect!(allow: allow.compact, allow_localhost: true)

Capybara.server = :puma, { Threads: '0:8' }
Capybara.register_driver :headless_chrome do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new(open_timeout: nil, read_timeout: 120)
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('headless')
  options.add_argument('start-maximized')

  options.add_argument('disable-dev-shm-usage') # resolves [docker]: chrome not reachable
  options.add_argument('disable-gpu')
  options.add_argument('no-sandbox')
  options.add_argument("window-size=#{browser_width},#{browser_height}")
  Capybara::Selenium::Driver.new(app, browser: :chrome, http_client:, options:)
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = javascript_driver
Capybara.configure do |config|
  config.default_max_wait_time = 5 # seconds
  config.default_driver = javascript_driver
end

RSpec.configure do |config|
  config.before(type: :feature) do
    page.driver.browser.manage.window.resize_to(browser_width, browser_height)
  end

  config.around :each, :without_js_errors do |example|
    original_raise_server_errors = Capybara.raise_server_errors
    Capybara.raise_server_errors = false

    example.run

    Capybara.raise_server_errors = original_raise_server_errors
  end

  config.around :each, type: :feature do |example|
    original_host = Rails.application.routes.default_url_options[:host]
    original_port = Rails.application.routes.default_url_options[:port]

    Rails.application.routes.default_url_options[:host] = Capybara.current_session.server.host
    Rails.application.routes.default_url_options[:port] = Capybara.current_session.server.port

    example.run
  ensure
    Rails.application.routes.default_url_options[:host] = original_host
    Rails.application.routes.default_url_options[:port] = original_port
  end
end
