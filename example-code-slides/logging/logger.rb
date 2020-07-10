require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

Selenium::WebDriver.logger.level = :debug

begin
  # Navigate to URL
  driver.get "https://google.com"
  Selenium::WebDriver.logger.info "This is info message"
  Selenium::WebDriver.logger.error "This is info message"
  Selenium::WebDriver.logger.warn "This is warning message"

  # Enter "webdriver" text and perform "ENTER" keyboard action
  driver.find_element(name: "q").send_keys "webdriver", :return
  sleep(1)
ensure

  driver.quit
end

