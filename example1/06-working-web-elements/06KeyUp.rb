require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  # Navigate to URL
  driver.get "https://google.com"

  # Enter "webdriver" text and perform "ENTER" keyboard action
  txtSearch = driver.find_element(name: "q")

  # Enters text "qwerty" with keyDown SHIFT key and after keyUp SHIFT key (QWERTYqwerty)
  driver.action.key_down(:shift).send_keys(txtSearch, "selenium").key_up(:shift).send_keys("webdriver").perform

  sleep (1)

  driver.action.key_down(:backspace).perform
  # driver.action.send_keys(:backspace).perform


  sleep(5)
ensure
  driver.quit
end
