require "rails_helper"

feature "Click on path" do 
	scenario "User views path" do
		visit demo_page_path
		click_link "Path"
		visit path_path

		expect(page).to have_content("Path")

	end
end