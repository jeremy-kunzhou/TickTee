require 'rails_helper'

feature 'Creating Projects' do
	scenario "can create a project" do
		visit '/'
		click_link 'New Project'
		fill_in 'Name', with: 'TextMate 2'
		fill_in 'Description', with: 'A project notification on rails'
		click_button 'Create Project'
		
		expect(page).to have_content('Project has been created.')
		
		project = Project.where(name: "TextMate 2").first
		expect(page.current_url).to eql(project_url(project))
		
		title = "TextMate 2 - Projects - Ticketee"
		expect(page).to have_title(title)
	end
	
	scenario "cannot create a project without a name" do
	  visit "/"
	  click_link "Create Project"
	  click_button "Create Project"
	  
	  expect(page).to have_content("Project has not been created.")
	  expect(page).to have_content("Name cannot be blank.")
	end
end