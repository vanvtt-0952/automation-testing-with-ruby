require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"


Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  # Navigate to URL
  driver.get "https://google.com"

  p driver.title
  # driver.find_element(name: "q").send_keys "webdriver"

  # element = driver.find_element :class, "hOoLGe"

  # driver.action.move_to(element).click.perform

  # sleep(5)
ensure
  # driver.quit
end
