require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "https://www.selenium.dev/documentation/en/webdriver/js_alerts_prompts_and_confirmations/"

  # Click the link to activate the alert
  driver.find_element(:link_text, "See a sample confirm").click

  # Store the alert reference in a variable
  alert = driver.switch_to.alert

  # Store the alert text in a variable
  alert_text = alert.text

  puts alert_text + "alert_text"

  # Press on Cancel button
  alert.dismiss
  sleep(1)

  # Press on OK button
  # alert.accept
ensure
  driver.quit
end
