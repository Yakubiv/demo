require "rails_helper"

feature "User" do 
	scenario "click on activites" do
		visit root_path
		click_link "Activites"
		expect(page).to have_content("Activites")
	end
end