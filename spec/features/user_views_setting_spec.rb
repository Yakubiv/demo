require "rails_helper"

feature "Setting" do 
	scenario "creation" do
		visit setting_path
		expect(page).to have_content("Setting")
	end
end