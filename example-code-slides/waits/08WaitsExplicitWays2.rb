require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox


begin
  driver.get "file:///home/tranvan/training/selenium/ruby/workspace/example1/WaitExample.html"
  wait = Selenium::WebDriver::Wait.new timeout: 10
  txtP = wait.until{driver.find_element(:css, "p")}

  puts "result: " << txtP.text
ensure
  driver.quit
end
