require "rails_helper"

feature "Comment" do 
	scenario "creation" do
		visit comment_path
		expect(page).to have_content("Comment")
	end
end