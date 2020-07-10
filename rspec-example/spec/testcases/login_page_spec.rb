require_relative "../spec_helper"
require_relative "../page_objects/login"

describe "Login page" do

  before(:each) do
    @login_wsm = Login.new(@driver)
  end

  it "input ussername and passwork, result has message succeeded" do
    @login_wsm.with("tomsmith", "SuperSecretPassword!")
    expect(@login_wsm.success_message_present?).to eql true
  end
end
