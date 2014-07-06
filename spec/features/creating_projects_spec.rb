require 'rails_helper'

feature "Creating Projects" do
  before do
    visit "/"
    click_link "New Project"
  end
	scenario "can create a project" do
		fill_in 'Name', with: 'TextMate 2'
		fill_in 'Description', with: 'A project notification on rails'
    select "2014", from: "project[start_at(1i)]"
    select "June", from: "project[start_at(2i)]"
    select "17", from: "project[start_at(3i)]"
    fill_in 'Expected progress', with: '0'
    fill_in 'Current progress', with: '10'
		click_button 'Create Project'
		
		expect(page).to have_content('Project has been created.')
		
		project = Project.where(name: "TextMate 2").first
		expect(page.current_url).to eql(project_url(project))
		
		title = "TextMate 2 - Projects - Ticketee"
		expect(page).to have_title(title)
	end
	
	scenario "cannot create a project without a name" do
	  click_button "Create Project"
	  
	  expect(page).to have_content("Project has not been created.")
	  expect(page).to have_content("Name cannot be blank.")
	end
  
	scenario "cannot create a project without current progress" do
	  click_button "Create Project"
		fill_in 'Name', with: 'TextMate 2'
		fill_in 'Description', with: 'A project notification on rails'
	  expect(page).to have_content("Project has not been created.")
	  expect(page).to have_content("Current progress can't be blank")
	end
end