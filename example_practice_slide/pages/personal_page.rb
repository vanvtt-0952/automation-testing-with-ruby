require_relative "page"

class PersonalPage < Page

  # Login
  Login_Form = {class: "el-form"}
  All_Input_Eles = {class: "el-input__inner"}
  Signup_Btn = {css: "button.el-button--primary"}

  # link
  Personal_Info = {css: ".fa.fa-user"} # or .fa.fa-user

  # form update person info
  Form_Person_Info = {class: "el-form mt-4 el-form--label-top"}
  Input_Elements = {css: ".el-input__inner"}

  Tag_Uls = {css: "ul.el-scrollbar__view.el-select-dropdown__list"}
  Selected_value = {css: ".el-select-dropdown__item.selected.hover > span"}


  def initialize
    super
    visit "https://accounts.viblo.asia/profile/personal"
    raise "Login page not ready" unless
      is_displayed?(Login_Form)
  end

  def When_input_value_for_all_input_to_login_success(username, password)
    elements = finds All_Input_Eles
    elements[0].send_keys username
    elements[1].send_keys password
    click Signup_Btn

    p "Curent url: #{@driver.current_url}"
  end

  def Then_click_link_person_info_to_display_form
    click Personal_Info
    p "display form change person info: #{is_displayed? Form_Person_Info}"
  end

  def Then_Input_Info_Person_To_Change
    elements = finds Input_Elements

    name = elements[0]
    p "Name: #{name.text}"
    name.send_keys "update name"
    p "Update: #{name.attribute :value}"

    username = elements[1]
    p "Username: #{username.text}"
    p "Is disable: #{username.attribute :disabled}"

    realName = elements[2]
    p "Real Name: #{realName.text}"
    realName.send_keys "update realName"
    p "Update: #{realName.attribute :value}"

    university = elements[3]
    # li selected
    if is_displayed?({css: ".selected.hover > span"})
      li_university = find({css: ".selected.hover > span"})
      p "university: #{university.attribute 'innerHTML'}"
    else
      p "university: empty"
    end
    university.click

    element_uls = finds(Tag_Uls)
    # university_options = element_uls[1].find_elements css: "li > span"
    # university_options.each { |option| p option.text}
    university_options[1].click



    birthday = elements[4]
    p "birthday: #{birthday.text}"
    birthday.send_keys "2020-06-09"
    p "Update: #{birthday.attribute :value}"

    university_selecteds = finds(Selected_value)
    p "university: #{university_selecteds[0].attribute 'innerHTML'}"


    gender = elements[5]
    # li selected
    selecteds = finds({css: ".selected.hover > span"})
    if selecteds.size >= 2
      p "Gender: #{selecteds[1].attribute 'innerHTML'}"
    else
      p "Gender: empty"
    end
    gender.click

    element_uls = finds(Tag_Uls)

    # gender_options = element_uls[1].find_elements css: "li > span"
    # gender_options.each { |option| p option.text}
    gender_options[1].click

    gender_selecteds = finds(Selected_value)
    p "Gender: #{gender_selecteds[1].attribute 'innerHTML'}"

    phone = elements[6]
    phone.send_keys (1223311)
  end

end
