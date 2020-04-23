require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://formy-project.herokuapp.com/datepicker"

  txtDatepicker = driver.find_element id: "datepicker"
  txtDatepicker.send_keys "04/09/2020"
  txtDatepicker.send_keys :return

  sleep 1

ensure
  driver.quit
end


