require "selenium-webdriver"
require "byebug"
require_relative  "../../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome
begin
  # Navigate to URL
  driver.get "https://www.w3schools.com/cssref/"

  link_css_selector = driver.find_element partial_link_text: "Selectors"

  p "full text: #{link_css_selector.text}"

  link_css_selector.click

  sleep(1)
ensure
  driver.quit
end

