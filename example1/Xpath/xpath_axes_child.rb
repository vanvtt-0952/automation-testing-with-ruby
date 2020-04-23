require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "https://www.guru99.com/"

  elements = driver.find_elements xpath: "//*[@id='java_technologies']//child::li"

  elements.each {|element| p "Node: #{element.text}"}


  sleep(1)

ensure
  driver.quit
end

