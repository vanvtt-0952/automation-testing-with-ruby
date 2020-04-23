require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  filename = "working-with-files/hi.jpg"
  file = File.join(Dir.pwd, filename)

  driver.get "http://the-internet.herokuapp.com/upload"
  driver.find_element(id: "file-upload").send_keys file
  driver.find_element(id: "file-submit").click

  uploaded_file = driver.find_element(id: "uploaded-files").text
  puts uploaded_file

  sleep(5)
ensure
  driver.quit
end
