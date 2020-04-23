require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://the-internet.herokuapp.com/dropdown"

  sleep 2
  dropdowns = driver.find_element id: "dropdown"
  options = dropdowns.find_elements tag_name: "option"
  options.each { |option| option.click if option.text == "Option 1" }

  selected_option = options.map { |option| puts option.text if option.selected? }
  sleep 1

ensure
  driver.quit
end
