require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "https://www.selenium.dev/documentation/en/webdriver/web_element/"
  txt_link = driver.find_element xpath: "//*[@id='body-inner']/h5/a[1]"

  sleep(2)

  driver.action.move_to(txt_link)
  puts "text : " + txt_link.text

  sleep(1)

  driver.action.double_click(txt_link).perform

  sleep(1)

ensure
  driver.quit
end
