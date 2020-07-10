require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "https://www.jqueryscript.net/demo/Clean-jQuery-Date-Time-Picker-Plugin-datetimepicker/"

  txtDatepicker = driver.find_element id: "datetimepicker"
  txtDatepicker.click

  dateWidget = driver.find_element xpath: "/html/body/div[4]/div[1]/div[2]/table"

  rows = dateWidget.find_elements :tag_name, "tr"

  columns = dateWidget.find_elements :tag_name, "td"

  columns.each do |day|
    if (day.text.eql? "10")
      day.click
      sleep 2
      break
    end
  end

  # time picker
  timeWidget = driver.find_element class: "xdsoft_timepicker"
  timeBox = driver.find_element class: "xdsoft_time_variant"
  rowsTimes = timeBox.find_elements tag_name: "div"

  rowsTimes.each do |time|
    if (time.text.eql? "04:00")
      time.click
      sleep 3
      break
    end
  end

  sleep 10

ensure
  driver.quit
end


