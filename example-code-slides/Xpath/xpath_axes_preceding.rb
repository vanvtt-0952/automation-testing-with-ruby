require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://demo.guru99.com/v1/"

  elements = driver.find_elements xpath: "//*[@type='submit']//preceding::input"

  elements.each {|element| p "name node: #{element.attribute :name}"}

  sleep(1)

ensure
  driver.quit
end

