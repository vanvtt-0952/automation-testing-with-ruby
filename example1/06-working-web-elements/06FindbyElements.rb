require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  # Navigate to URL
  driver.get "https://www.youtube.com/"

  # Enter "webdriver" text and perform "ENTER" keyboard action
  links = driver.find_elements(id: "video-title-link")
  puts "size element: #{links.size}"

  links[1].click

  sleep(5)
ensure
  driver.quit
end
