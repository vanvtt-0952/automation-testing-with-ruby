require "selenium-webdriver"
capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
driver = Selenium::WebDriver.for :firefox, url: "http://127.0.0.1:4444/wd/hub", desired_capabilities: capabilities

begin
  driver.get "http://formy-project.herokuapp.com/checkbox"
  checkboxes = driver.find_elements(css: "input[type='checkbox']")

  checkboxes.first.click

  puts "With .attribute('checked')"
  checkboxes.each { |checkbox| puts checkbox.attribute("checked").inspect }

  puts "\nWith .selected?"
  checkboxes.each { |checkbox| puts checkbox.selected?.inspect }
  sleep 1

ensure
  driver.quit
end
