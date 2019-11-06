require 'selenium-webdriver'
require 'webdrivers'
require 'capybara'
require 'capybara/rspec'

Capybara.register_driver :selenium_ie do |app|
  options = Selenium::WebDriver::IE::Options.new
  Capybara::Selenium::Driver.new(app, browser: :ie, options: options)
end

Capybara.register_driver :selenium_safari do |app|
  options = Selenium::WebDriver::Safari::Options.new
  Capybara::Selenium::Driver.new(app, browser: :safari, options: options)

end

Capybara.register_driver :selenium_firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.register_driver :selenium_edge do |app|
  options = Selenium::WebDriver::Edge::Options.new
  Capybara::Selenium::Driver.new(app, browser: :edge, options: options)
end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: [
    '--headless',
    '--no-sandbox',
    '--disable-gpu',
  ])
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_max_wait_time = 3
Capybara.app_host = 'https://www.google.co.jp/'

Capybara.default_driver = case ENV['BROWSER']
                          when 'ie'
                            :selenium_ie
                          when 'safari'
                            :selenium_safari
                          when 'firefox'
                            :selenium_firefox
                          when 'edge'
                            :selenium_edge
                          else
                            :selenium_chrome
                          end

RSpec.configure do |config|
  config.include Capybara::DSL
end
