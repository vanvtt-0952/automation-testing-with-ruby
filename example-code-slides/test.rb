require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path= DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

driver.navigate.to "https://www.google.com/"
element = driver.find_element(:name, "q")
element.send_key "hello vanvtt"
element.submit
driver.quit
