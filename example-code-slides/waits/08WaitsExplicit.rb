require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

wait = Selenium::WebDriver::Wait.new timeout: 10

def document_initialised driver
  driver.execute_script "return initialised"
end

begin
  driver.get "file:///home/tranvan/training/selenium/ruby/workspace/example1/WaitExample.html"
  wait.until{document_initialised driver}
  txtP = driver.find_element(:css, "p").text

  puts "result: " << txtP
ensure
  driver.quit
end
