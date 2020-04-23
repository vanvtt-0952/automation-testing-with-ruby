require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  driver.get "https://github.com/"

  # Attribute Start with ^=
  # driver.find_element(css: "input[name^='user']").send_keys "vanvtt"
  # elements = driver.find_elements(css: "[name^='user']")

  # p "size: #{elements.size}"

  # elements.each {|item| p item.attribute :class}

  # Attribute Contains *=
  # driver.find_element(css: "input[name*='login']").send_keys "vanvtt"

  #  Attribute  ends with $=
  driver.find_element(css: "input[name$='login]']").send_keys "vanvtt"
  sleep(1)

ensure
  driver.quit
end

