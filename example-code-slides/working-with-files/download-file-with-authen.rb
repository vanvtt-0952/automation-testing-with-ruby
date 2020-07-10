require "rest-client"
require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://admin:admin@the-internet.herokuapp.com/download_secure"
  sleep(1)
  cookie = driver.manage.cookie_named "rack.session"
  link = driver.find_element(css: ".example a").attribute("href")
  response = RestClient.head link, cookie: { cookie[:name] => cookie[:value] }
  puts response.headers[:content_type]
  puts response.headers[:content_length].to_i

  sleep(2)
ensure
  driver.close
end
