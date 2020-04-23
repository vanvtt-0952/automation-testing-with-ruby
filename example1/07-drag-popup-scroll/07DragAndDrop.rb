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

  # We'll use actions to click and hold the element, drag it, the drop it appropriately
  driver.action.click_and_hold(from).perform
  driver.action.move_to(to).perform
  driver.action.release.perform

  sleep(1)
ensure
  driver.quit
end
