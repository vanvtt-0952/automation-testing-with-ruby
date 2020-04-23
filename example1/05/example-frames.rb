require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER

driver = Selenium::WebDriver.for :firefox

begin
  # Navigate to URL
  driver.get "file:///home/tranvan/training/selenium/ruby/workspace/example1/05/iframew-exam.html"

  # Store iframe web element
  iframe = driver.find_element(:css, "#modal > iframe")

  # Switch to the frame
  driver.switch_to.frame iframe

  sleep(2)

  # Now, Click on the button
  driver.find_element(:id, "my_playlist").click

  sleep(2)

  driver.switch_to.default_content

  driver.find_element(id: "my_link").click
ensure
  driver.quit
end
