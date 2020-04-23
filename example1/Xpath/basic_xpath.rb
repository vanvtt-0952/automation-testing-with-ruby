require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://demo.guru99.com/v1/"
  usertxt = driver.find_element xpath: "//input[@name='uid']"
  usertxt.send_keys "vanvtt"

  sleep(1)

ensure
  driver.quit
end
