require 'spec_helper'

feature 'Visitor sign_up path' do
	scenario 'with valid email' do
		user = FactoryGirl.build(:user,email: 'petro@gmail.com',password: 'password')
		visit root_path
		click_link 'Sign Up'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		fill_in 'Confirmation password', with: user.password
		click_on 'Sign up'
		expect(page).to have_content(user.email)
	end	
end