require "selenium-webdriver"
require "byebug"
require_relative  "../driver/base_driver.rb"

class Page
  def initialize
    Selenium::WebDriver::Chrome.driver_path = BaseDriver::CHROME_DRIVER
    Selenium::WebDriver::Firefox.driver_path = BaseDriver::FIREFOX_DRIVER

    @driver = Selenium::WebDriver.for BaseDriver::BROWSER
  end

  def visit(url_path)
    @driver.get url_path
  end

  def find(locator)
    @driver.find_element locator
  end

  def finds(locator)
    @driver.find_elements locator
  end

  def type(locator, text)
    find(locator).send_keys text
  end

  def click(locator)
    find(locator).click
  end

  def is_displayed?(locator)
    begin
      find(locator).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end

  def wait_for(seconds = 15)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

end
