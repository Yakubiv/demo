require "rails_helper"

feature "User" do 
	scenario "click on setting" do
		visit root_path
		click_link "Setting"
		expect(page).to have_content("Setting")
	end
end