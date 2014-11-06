require "rails_helper"

feature "User" do 
	scenario "click on progress" do
		visit root_path
		click_link "Progress"
		expect(page).to have_content("Progress")
	end
end