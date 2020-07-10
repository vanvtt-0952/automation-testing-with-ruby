require_relative "../pages/login_page"

@login = LoginPage.new
@login.When_input_value_for_all_input("van.vu010193@gmail.com", "van.vu93")
@login.display_account_page
