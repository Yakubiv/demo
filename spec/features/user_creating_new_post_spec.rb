require 'spec_helper'

feature 'Creating new post' do
	background do
		sign_in_with 'petro.yakubiv@gmail.com', 'password'
	end
	scenario 'vith correct data' do
		user = FactoryGirl.create(:user)
		post = FactoryGirl.create(:post)
		click_link 'NEW SHPORA'
		fill_in 'Title', with: post.title
		fill_in 'Content', with: post.content
		click_on 'Add new'

	end	
	def sign_in_with(email, password)
		user = FactoryGirl.create(:user)
		visit root_path
		click_link 'Sign In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_on 'Sign in'
		expect(page).to have_content(user.email)
	end

end