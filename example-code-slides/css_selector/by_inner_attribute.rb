require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://demo.guru99.com/test/facebook.html"

  ele = driver.find_element css: "input.inputtext[tabindex='1']"
  p ele.attribute :name
  sleep(1)

ensure
  driver.quit
end

