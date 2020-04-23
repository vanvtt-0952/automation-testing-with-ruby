require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://demo.guru99.com/v1/"

  element = driver.find_element xpath: "//*[@type='password']//self::input"

  element.send_keys "aaaaa"

  sleep(1)

ensure
  driver.quit
end

