require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://the-internet.herokuapp.com/tables"

  sleep 1
  driver.find_element(css: "#table1 thead tr th:nth-of-type(3)").click

  emails = driver.find_elements(css: "#table1 tbody tr td:nth-of-type(3)")
  email_values = emails.map { |email| puts email.text }

  sleep 1

ensure
  driver.quit
end

