require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://formy-project.herokuapp.com/radiobutton"

  radio1 = driver.find_element id: "radio-button-1"
  radio1.click
  puts radio1.selected?
  sleep 1

  radio2 = driver.find_element css: "input[value='option2']"
  radio2.click
  puts radio1.selected?
  sleep 1

  radio3 = driver.find_element xpath: "/html/body/div/div[3]/input"
  radio3.click
  sleep 1

ensure
  driver.quit
end

