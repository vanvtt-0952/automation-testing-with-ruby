require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://www.anaesthetist.com/mnm/javascript/calc.htm"
  driver.find_element(name: "nine").click()
  driver.find_element(name: "add").click()
  driver.find_element(name: "three").click()
  driver.execute_script("Calculate();")
  sleep 1

ensure
  driver.quit
end
