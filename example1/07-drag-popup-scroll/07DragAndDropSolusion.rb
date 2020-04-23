require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
   driver.navigate.to("http://crossbrowsertesting.github.io/drag-and-drop.html")

  # first, let's grab the draggable element
  from = driver.find_element(:id, "draggable")

  # then, we'll grab the droppable element
  to = driver.find_element(:id, "droppable")

  # driver.action.drag_and_drop(from, to).perform

  driver.action.drag_and_drop_by(from, 160, 30).perform
  sleep(5)
ensure
  driver.quit
end
