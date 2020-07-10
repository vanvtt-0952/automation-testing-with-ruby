require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin

  # the element is not on the page and gets added in.
  driver.get "http://the-internet.herokuapp.com/dynamic_loading/2"

  driver.find_element(css: "#start button").click

  # if change timeout is 2, has throw no such element: Unable to locate element
  # because, html page setting that: after 5 second will "Hello World!" with id = finish
  Selenium::WebDriver::Wait.new(timeout: 6).until { driver.find_element(id: "finish").displayed? }

ensure
  driver.quit
end
