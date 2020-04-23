require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://formy-project.herokuapp.com/checkbox"

  radio1 = driver.find_element id: "checkbox-1"
  radio1.click
  puts radio1.selected?
  sleep 1

  radio1.click
  puts radio1.selected?
  sleep 1

  radio1.click

  radio2 = driver.find_element id: "checkbox-2"
  radio2.click
  sleep 1

ensure
  driver.quit
end

