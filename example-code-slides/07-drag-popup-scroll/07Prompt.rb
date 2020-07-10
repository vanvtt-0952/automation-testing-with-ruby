require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  driver.get "https://www.selenium.dev/documentation/en/webdriver/js_alerts_prompts_and_confirmations/"

  # Click the link to activate the alert
  driver.find_element(:link_text, "See a sample prompt").click

  # Store the alert reference in a variable
  alert = driver.switch_to.alert
  sleep(1)

  alert.send_keys "WebDriver"
  # Press on Cancel button
  # alert.dismiss
  sleep(1)

  # Press on OK button
  alert.accept
  sleep(1)
ensure
  driver.quit
end
