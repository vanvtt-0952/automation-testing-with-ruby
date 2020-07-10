require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

driver.manage.timeouts.implicit_wait = 3

begin

  # the element is not on the page and gets added in.
  driver.get "http://the-internet.herokuapp.com/dynamic_loading/1"

  driver.find_element(css: "#start button").click

  driver.find_element(id: "finish").displayed?

  #  if change implicit_wait = 13, we will get "Hello World" text
  # a bad option since it would impact all of the tests that use this setup.
  #  Using explicit waits
  puts "text " + driver.find_element(xpath: "//*[@id='finish']/h4").text
ensure
  driver.quit
end

