require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome
begin
  # Navigate to URL
  driver.get "https://google.com"

  # Enter "webdriver" text and perform "ENTER" keyboard action
  driver.find_element(name: "q").send_keys "webdriver", :return

  sleep(5)
ensure
  driver.quit
end

