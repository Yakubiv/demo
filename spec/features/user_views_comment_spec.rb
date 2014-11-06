require "rails_helper"

feature "User" do 
	scenario "click on comment" do
		visit root_path
		click_link "Comment"
		expect(page).to have_content("Comment")
	end
end