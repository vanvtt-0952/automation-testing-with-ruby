require "selenium-webdriver"
require "test/unit"
require "byebug"
require_relative  "../driver/driver_variable.rb"

class LoginClass < Test::Unit::TestCase

  def setup
    Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
    @driver = Selenium::WebDriver.for :chrome
    @driver.get("https://github.com/")
    @driver.manage.window.maximize
  end


  def teardown
    @driver.quit
  end


  def test_login
    @driver.find_element(:xpath, "/html/body/div[1]/header/div/div[2]/div[2]/a[1]").click
    @driver.find_element(:id, "login_field").send_keys "******"
    @driver.find_element(:id, "password").send_keys "******"
    @driver.find_element(:xpath, "/html/body/div[3]/main/div/form/div[4]/input[9]").click
    sleep 0.3

    @driver.find_element(:xpath, "/html/body/div[1]/header/div[7]/details/summary").click

    assert(@driver.find_element(:xpath, "/html/body/div[1]/header/div[7]/details/details-menu/div[1]/a")
      .text.include?("vanvtt"))
  end
end
