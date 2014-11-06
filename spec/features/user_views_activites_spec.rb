require "rails_helper"

feature "Activites" do 
	scenario "creation" do
		visit activities_path
		page.should have_content("Activites")
	end
end