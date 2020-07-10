require_relative "../spec_helper"
require_relative "../page_objects/login"

describe "Login page" do

  before(:each) do
    @bowser = Login.new(@driver)
  end

  it "check Screen login" do
    expect(@driver.title).to include ("Login")
  end

  it "input blank for email and password, result has message error" do
    @bowser.When_input_value_for_all_input("", "")

    messages = @driver.find_elements css: "div.el-form-item__error"
    expect(messages.size).to eq 2
    messages.each do |item|
      expect(item.text).to include ("require")
    end
  end

  it "input blank for email and password not blank, result has message error for email" do

    @bowser.When_input_value_for_all_input("", "123123")

    messages = @driver.find_elements css: "div.el-form-item__error"
    expect(messages.size).to eq 1
    messages.each do |item|
      expect(item.text).to include ("require")
      expect(item.text).to include ("Username/email")
    end

    password = @driver.find_element css: "input[type='password']"
    expect(password.attribute("value")).to eq "123123"
  end

  it "input blank for password and email not blank, result has message error for password" do

    @bowser.When_input_value_for_all_input("van@gmail.com", "")

    messages = @driver.find_elements css: "div.el-form-item__error"
    expect(messages.size).to eq 1
    messages.each do |item|
      expect(item.text).to include ("require")
      expect(item.text).to include ("Password")
    end

    email = @driver.find_element css: "input[placeholder='Username or email']"
    expect(email.attribute("value")).to eq "van@gmail.com"
  end
end
