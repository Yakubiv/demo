require "rails_helper"

feature "User" do 
	scenario "click on map" do
		visit root_path
		click_link "Map"
		expect(page).to have_content("Map")
	end
end