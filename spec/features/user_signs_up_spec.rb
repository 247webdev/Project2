require 'rails_helper'

feature 'Visitor clicks signup' do 
  scenario 'successful redirect' do 
    # setup
    visit root_path
    
    # exercise
    click_button "Signup with email"

    # verify
    expect(page).to have_content("Create a Profile")
    expect(page).to have_content("First Name")
    expect(page).to have_content("Last Name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Zip Code")
  end
end

feature 'Visitor creates profile' do
  scenario 'successful creation' do
    # setup
    visit root_path
    click_button "Signup with email"

    #exercise
    fill_in "First Name", with: "Jim"
    fill_in "Last Name", with: "Bob"
    fill_in "Email", with: "Jim@email.com"
    fill_in "Password", with: "1234"
    fill_in "Zip Code", with: "86001"
    click_button "Submit"

    #verify
    expect(page).to have_content("Logout")
    expect(page).to have_content("Search Profiles")
    expect(page).to have_content("Location")
    expect(page).to have_content("Category")
    expect(page).to have_content("Logout")
  end

  scenario 'no password' do
    # setup
    visit root_path
    click_button "Signup with email"

    # exercise
    fill_in "First Name", with: "Jim"
    fill_in "Last Name", with: "Bob"
    fill_in "Email", with: "Jim@email.com"
    fill_in "Zip Code", with: "86001"
    fill_in "Password", with: ""
    click_button "Submit"

    # verify
    expect(page).to have_content("Please enter a password")
    expect(page).to have_content("Create a Profile")
  end

  scenario 'no first name' do
    # setup
    visit root_path
    click_button "Signup with email"

    # exercise
    fill_in "First Name", with: ""
    fill_in "Last Name", with: "Bob"
    fill_in "Email", with: "Jim@email.com"
    fill_in "Zip Code", with: "86001"
    fill_in "Password", with: "1234"
    click_button "Submit"

    #verify
    expect(page).to have_content("Please enter a first name")
    expect(page).to have_content("Create a Profile")
  end
end

