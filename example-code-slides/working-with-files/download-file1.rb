require "uuid"
require "fileutils"
require "selenium-webdriver"
require "byebug"
require_relative  "../driver/driver_variable.rb"

Selenium::WebDriver::Firefox.driver_path =  DriverVariable::FIREFOX_DRIVER

begin
  # Settup
  download_dir = File.join(Dir.pwd, UUID.new.generate)
  FileUtils.mkdir_p download_dir

  # Firefox
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile["browser.download.dir"] = download_dir
  profile["browser.download.folderList"] = 2
  profile["browser.helperApps.neverAsk.saveToDisk"] = "images/jpeg, application/pdf, application/octet-stream"
  profile["pdfjs.disabled"] = true
  driver = Selenium::WebDriver.for :firefox, profile: profile

  # Run test
  driver.get "http://the-internet.herokuapp.com/download"
  download_link = driver.find_element(css: ".example a")
  download_link.click

  files = Dir.glob("#{@download_dir}/*")
  puts "has file is: " + files.empty?.to_s
  puts "Size file: " + File.size(files.first).to_s
ensure
  driver.quit
end
