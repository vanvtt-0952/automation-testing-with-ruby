require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER
driver = Selenium::WebDriver.for :firefox

begin
  # driver.get "http://demo.guru99.com/test/drag_drop.html"

  # from =driver.find_element(xpath: "//*[@id='credit2']/a")
  # to =driver.find_element xpath: "//*[@id='bank']/li"

  # sleep(1)
  # driver.action.drag_and_drop(from, to).perform

  # sleep(15)


   driver.navigate.to("http://crossbrowsertesting.github.io/drag-and-drop.html")

        # first, let's grab the draggable element
        puts "Grabbing draggable element"
        from = driver.find_element(:id, "draggable")

        # then, we'll grab the droppable element
        puts "Grabbing droppable element"
        to = driver.find_element(:id, "droppable")

        # We'll use actions to click and hold the element, drag it, the drop it appropriately
        puts "Dragging and dropping element"
        driver.action.click_and_hold(from).perform
        driver.action.move_to(to).perform
        driver.action.release.perform
sleep(1)
        # we'll assert the final state of the droppable element to ensure its in the state we want.
        droppableText = driver.find_element(:xpath, "//*[@id=\"droppable\"]/p").text

sleep(1)
ensure
  driver.quit
end
