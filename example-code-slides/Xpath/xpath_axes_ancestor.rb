require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "https://accounts.lambdatest.com/login"

  parentDiv = driver.find_element xpath: "//input[@name='password']//ancestor::div[1]"
  p "class #{parentDiv.attribute :class}"

  # return 3 tags input text
  parentForm = driver.find_element xpath: "//input[@name='password']//ancestor::form"

  p "action #{parentForm.attribute :action}"

  sleep(1)

ensure
  driver.quit
end

