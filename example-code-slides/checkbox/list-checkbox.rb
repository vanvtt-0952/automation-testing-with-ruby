require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://formy-project.herokuapp.com/checkbox"
  checkboxes = driver.find_elements(css: "input[type='checkbox']")

  checkboxes.first.click

  puts "With .attribute('checked')"
  checkboxes.each { |checkbox| puts checkbox.attribute("checked").inspect }

  puts "\nWith .selected?"
  checkboxes.each { |checkbox| puts checkbox.selected?.inspect }
  sleep 1

ensure
  driver.quit
end

