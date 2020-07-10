require "selenium-webdriver"
require "byebug"
require_relative  "../driver/base_driver.rb"

RSpec.configure do |config|

  config.before(:each) do |example|

    Selenium::WebDriver::Chrome.driver_path = BaseDriver::CHROME_DRIVER
    Selenium::WebDriver::Firefox.driver_path = BaseDriver::FIREFOX_DRIVER

    @driver = Selenium::WebDriver.for BaseDriver::BROWSER
  end

  config.after(:each) do |example|
    @driver.quit
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
