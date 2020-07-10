require_relative "../pages/personal_page"

@personal_info = PersonalPage.new
@personal_info.When_input_value_for_all_input_to_login_success("van.vu010193@gmail.com", "van.vu93")
@personal_info.Then_click_link_person_info_to_display_form
@personal_info.Then_Input_Info_Person_To_Change
