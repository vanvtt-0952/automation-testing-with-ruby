require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://demo.guru99.com/v1/"

  usertxt = driver.find_element xpath: "//input[@name='uid']"
  usertxt.send_keys "vanvtt"

  driver.action.key_down(:control).send_keys("a")
    .key_up(:control).key_down(:backspace).perform

  driver.find_element(xpath: "//input[@name='password']").click
  sleep 1

  message = driver.find_element xpath: "//label[starts-with(@id,'message')]"

  p "message: #{message.text}"
  sleep(1)

ensure
  driver.quit
end

