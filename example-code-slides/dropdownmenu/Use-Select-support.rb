require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "http://the-internet.herokuapp.com/dropdown"

  sleep 2
  dropdown = driver.find_element id: "dropdown"

  selects = Selenium::WebDriver::Support::Select.new dropdown
  selects.select_by(:text, 'Option 1')

  selected_option = selects.selected_options[0].text

  puts selected_option
  sleep 1
ensure
  driver.quit
end
