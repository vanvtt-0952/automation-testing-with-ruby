require "selenium-webdriver"
require "csv"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin

  # get data from csv file
  user_datas = CSV.read Dir.pwd + "/data-driver/user_data.csv"
  descriptor = user_data.shift
  descriptor = descriptor.map { |key| key.to_sym }
  user_datas.map { |user| Hash[ descriptor.zip(user) ] }

  user_datas.each do |user|
    driver.get "http://the-internet.herokuapp.com/login"
    driver.find_element(id: "username").send_keys user[1]
    driver.find_element(id: "password").send_keys user[2]
    driver.find_element(id: "login").submit
    begin

      # get notification text
      wait = Selenium::WebDriver::Wait.new(timeout: 5)
      wait.until {driver.find_element(class: "flash").displayed?}
      notification_text = driver.find_element(class: "flash").text.delete("^a-zA-z !.")

      puts "notification_text: " + notification_text
    rescue Exception => error
      puts error.message
    end
  end

  sleep 1

ensure
  driver.quit
end

