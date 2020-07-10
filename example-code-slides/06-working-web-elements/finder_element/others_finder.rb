require "selenium-webdriver"
require "byebug"
require_relative  "../../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path = DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome

begin
  url = "file://" << FFile.expand_path("/Webdriver-Ruby-example_base/example-code-slides/06-working-web-elements/finder_element/demo.html")

  driver.get url

  # # By tag name
  # name_tag = driver.find_element tag_name: "button"
  # p "tag name example: #{name_tag.text}"

  # sleep(1)

  # By class
  # css = driver.find_element class: "btn"
  # p "css example: #{css.text}"

  # By id
  # email = driver.find_element id: "email"
  # email.send_keys "vanvtt"
  # p "email: #{email.attribute :value}"

  # By name
  # name = driver.find_element name: "email"
  # name.send_keys "vanvtt"
  # p "name: #{name.attribute :value}"

  # By Xpath
  # xpath = driver.find_element xpath: "//*[@id='email']"
  # xpath.send_keys "vanvtt"
  # p "xpath: #{xpath.attribute :value}"

  xpath = driver.find_element xpath: "//*[@class='link_cus']"
  xpath.click

  # By Css selector
  # css_selector = driver.find_element css: "#email"
  # css_selector.send_keys "vanvtt"
  # p "css_selector: #{css_selector.attribute :value}"


  # btn_by_selector = driver.find_element css: "div.col-sm-offset-2.col-sm-10 .btn.btn-default"
  # p "by css selector example: #{btn_by_selector.text}"

  sleep(1)
ensure
  driver.quit
end

