require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "http://the-internet.herokuapp.com/context_menu"
  menu_area = driver.find_element id: "hot-spot"
  driver.action.context_click(menu_area).send_keys(
    :arrow_down).send_keys(
    :arrow_down).send_keys(
    :arrow_down).send_keys(
    :enter).perform

    sleep 1
  ensure
    driver.quit
  end

