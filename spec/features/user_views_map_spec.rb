require "rails_helper"

feature "Maps" do 
	scenario "creation" do
		visit map_path
		expect(page).to have_content("Maps")
	end
end