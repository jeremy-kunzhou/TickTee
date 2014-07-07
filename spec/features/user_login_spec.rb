require 'rails_helper'

feature "User Function" do
  let!(:user){FactoryGirl.create(:user)}
  let!(:project) {FactoryGirl.create(:project, user: user)}
  let!(:other_user){FactoryGirl.create(:user, email: "other@example.com")}
  let!(:other_project) {FactoryGirl.create(:project, name: "other project", user: other_user)}
  
  scenario "Registered user can log in" do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    expect(page).to have_content("Signed in successfully")
  end
  
  scenario "User can only see the project belongs to him" do
    sign_in_as(user)
    expect(page).to have_content(project.name)
    expect(page).to_not have_content(other_project.name)
  end
end