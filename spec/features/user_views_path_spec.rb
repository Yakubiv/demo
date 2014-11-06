require "rails_helper"

feature "User click on" do 
	scenario "path" do
		visit root_path
		click_link "Path"
		expect(page).to have_content("Path")

	end
end