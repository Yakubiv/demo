require "rails_helper"

feature "User" do 
	scenario "click on path" do
		visit root_path
		click_link "Path"
		expect(page).to have_content("Path")

	end
end