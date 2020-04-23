require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox
begin
  # Navigate to URL
  driver.get "https://google.com"

  # Enter "webdriver" text and perform "ENTER" keyboard action
  driver.find_element(name: "q").send_keys "webdriver"
 driver.action.key_down(:control).send_keys("a").perform

  sleep(5)
ensure
  driver.quit
end

