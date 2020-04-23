require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "https://www.google.com/"

  driver.execute_script("alert('Hi, ruby test')")
  sleep 1

ensure
  driver.quit
end
