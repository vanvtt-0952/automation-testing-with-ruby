require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://formy-project.herokuapp.com/datepicker"

  txtDatepicker = driver.find_element id: "datepicker"
  txtDatepicker.click

  dateWidget = driver.find_element class: "datepicker-days"

  rows = dateWidget.find_elements :tag_name, "tr"

  columns = dateWidget.find_elements :tag_name, "td"

  columns.each do |cell|
    if (cell.text.eql? "10")
      cell.click
      sleep 2
      break
    end
  end

  sleep 10

ensure
  driver.quit
end


