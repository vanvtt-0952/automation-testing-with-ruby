require_relative "page"

class Login < Page

  Login_Form = {class: "el-form"}
  All_Input_Eles = {class: "el-input__inner"}
  Signup_Btn = {css: "button.el-button--primary"}

  Wellcome_Account = {css: "h1.greeting-title"}

  def initialize(driver)
    super
    visit "https://accounts.viblo.asia/login"
    raise "Login page not ready" unless
      is_displayed?(Login_Form)
  end

  def When_input_value_for_all_input(username, password)
    elements = finds All_Input_Eles
    elements[0].send_keys username
    elements[1].send_keys password
    click Signup_Btn
  end

  def display_account_page
    p "url: #{@driver.current_url}"
    p "Display: #{find(Wellcome_Account).text}"
  end

end
