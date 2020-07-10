require "selenium-webdriver"
require "byebug"
require_relative  "../../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  url = "file://" << File.expand_path("/Webdriver-Ruby-example_base/example-code-slides/06-working-web-elements/finder_element/demo.html")

  # get partial text of link
  driver.get url

  partial_text = driver.find_element partial_link_text: "Visit"
  p "full text of link: #{partial_text.text}"

  partial_text.click
  sleep(1)


  # get link or lik_text
  driver.get url

  link_selector = driver.find_element link_text: "Visit W3Schools.com!"

  # // Same: link_selector = driver.find_element link: "Visit W3Schools.com!"
  p "full text: #{link_selector.text}"

  link_selector.click
  sleep(1)

ensure
  driver.quit
end

