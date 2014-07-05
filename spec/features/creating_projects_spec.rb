require 'rails_helper'

feature 'Creating Projects' do
	scenario "can create a project" do
		visit '/'
		click_link 'New Project'
		fill_in 'Name', with: 'TextMate 2'
		fill_in 'Description', with: 'A project notification on rails'
		click_button 'Create Project'
		
		expect(page).to have_content('Project has been created.')
	end
end