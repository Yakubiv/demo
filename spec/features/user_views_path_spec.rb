require "spec_helper"

feature "Path" do 
	scenario "creation" do
		visit path_path
		page.should have_content("Path")

	end
end