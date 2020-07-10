require_relative "page"

class RegisterPage < Page

  Register_Form = {class: "el-form"}
  Name_Input  = {css: "input[placeholder='Your name']"}
  Email_Input  = {css: "input[placeholder='Your email address']"}
  Username_Input = {css: "input[placeholder='Username']"}
  Password_Input = {css: "input[placeholder='Password']"}
  Password_Confirm_Input = {css: "input[placeholder='Confirm your password']"}

  All_Input_Eles = {class: "el-input__inner"}

  Agree_Checkbox = {css: "span.el-checkbox__input"}
  Signup_Btn = {css: "button.el-button--primary"}

  Messages_Validate = {class: "el-form-item__error"}

  Notification_Regis_Succ = {css: ".el-alert__description > div > p"}

  def initialize
    super
    visit "https://accounts.viblo.asia/register"
    raise "Register page not ready" unless
      is_displayed?(Register_Form)
  end

  # 1
  def When_not_input_value_for_all_input
    click Name_Input
    click Email_Input
    click Username_Input
    click Password_Input
    click Password_Confirm_Input
    click Agree_Checkbox
  end

  # other
  def Other_way_When_not_input_value_for_all_input
    elements = finds All_Input_Eles
    elements.each {|item| click item}
  end

  def display_all_message_validate_fail
    elements = finds Messages_Validate
    elements.each {|item| p item.text}
  end

  # 2
  def when_input_all_text_to_register_success(name, email, username, password, password_conf)
    type(Name_Input, name)
    type(Email_Input, email)
    type(Username_Input, username)
    type(Password_Input, password)
    type(Password_Confirm_Input, password_conf)

    click Agree_Checkbox
    click Signup_Btn
  end

  def display_notification_Check_email_When_Register_Suceessfully
    p find(Notification_Regis_Succ).text
  end

end
