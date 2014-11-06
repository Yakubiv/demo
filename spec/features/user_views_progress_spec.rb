require "rails_helper"

feature "Progress" do 
	scenario "creation" do
		visit progress_path
		expect(page).to have_content("Progress")
	end
end