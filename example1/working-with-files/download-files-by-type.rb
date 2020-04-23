require "rest-client"
require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Chrome.driver_path =  DriverVariable::CHROME_DRIVER
driver = Selenium::WebDriver.for :chrome


def content_type(file)
  file = File.basename(file)
  if file.include? ".jpg"
    "image/jpeg"
  elsif file.include? ".pdf"
    "application/pdf"
  else
    # raise
    "Unknown file type"
  end
end


begin
  driver.get "http://admin:admin@the-internet.herokuapp.com/download_secure"

  links = driver.find_elements(css: ".example a")

  links.map! { |link| link.attribute("href") }

  links.each do |link|
    response = RestClient.head link
    puts response.headers[:content_type]

    puts content_type(link)
  end

  sleep(2)
ensure
  driver.quit
end
