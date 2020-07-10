require "rest-client"
require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://the-internet.herokuapp.com/download"
  sleep(1)
  link = driver.find_element(css: ".example a").attribute("href")
  response = RestClient.head link

  puts response.headers[:content_type]

  puts response.headers[:content_length].to_i

  sleep(2)
ensure
  driver.close
end
