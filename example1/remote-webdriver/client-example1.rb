require "selenium-webdriver"

driver = Selenium::WebDriver.for :remote, url: "http://192.168.1.136:4444/wd/hub", desired_capabilities: :chrome

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
