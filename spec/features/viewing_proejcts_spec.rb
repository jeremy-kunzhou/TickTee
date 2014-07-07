require 'rails_helper'

feature "Viewing projects" do
  
  let!(:user) {FactoryGirl.create(:user)}
  before do
    sign_in_as(user)
  end
  scenario 'listing all projects' do
    project = FactoryGirl.create(:project, name: "TextMate 2", user: user)
    visit user_projects_path(user)
    click_link "TextMate 2"
    expect(page.current_url).to eql(user_projects_url(user))
  end
end