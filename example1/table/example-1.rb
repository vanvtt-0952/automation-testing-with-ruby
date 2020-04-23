require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://the-internet.herokuapp.com/tables"

  sleep 1
  # No.of columns
  cols = driver.find_elements(css: "#table1 thead tr th")
  puts "columns: " + cols.size.to_s

  # No.of Rows
  rows = driver.find_elements(css: "#table1 tbody tr td:nth-of-type(1)")
  puts "rows: " + rows.size.to_s

  sleep 1

ensure
  driver.quit
end
