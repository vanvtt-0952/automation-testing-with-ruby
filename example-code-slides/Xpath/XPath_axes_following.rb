require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://demo.guru99.com/v1/"

  usertxt = driver.find_element xpath: "//input[@name='uid']"

  # return 3 tags input text
  elements = driver.find_elements xpath: "//*[@type='text']//following::input"
  p "size: #{elements.size}"


  # focus on any particular element
  element = driver.find_element xpath: "//*[@type='text']//following::input[2]"
  p "element: #{element.attribute :value}"
  sleep(1)

ensure
  driver.quit
end

