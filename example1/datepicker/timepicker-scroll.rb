require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  # Navigate to URL
  driver.get "https://www.jqueryscript.net/demo/Clean-jQuery-Date-Time-Picker-Plugin-datetimepicker/"

  txtDatepicker = driver.find_element class: "xdsoft_inline"

driver.action.move_to(txtDatepicker)

  timeWidget = driver.find_element class: "xdsoft_timepicker"

  btnNext = timeWidget.find_element :class, "xdsoft_next"

  scrollBar = timeWidget.find_element class: "xdsoft_scrollbar"

  timeBox = driver.find_element class: "xdsoft_time_variant"
  rowsTimes = timeBox.find_elements tag_name: "div"

  btnNext.click
  sleep 1
  btnNext.click
  sleep 1
  btnNext.click
  sleep 1
  btnNext.click
  sleep 1
  sleep 10

ensure
  driver.quit
end


