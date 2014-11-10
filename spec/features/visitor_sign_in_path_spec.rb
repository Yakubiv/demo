require 'spec_helper'

feature 'Visitor sign_in path' do
	scenario 'with valid email' do
        user = FactoryGirl.create(:user)
		visit root_path
		click_link 'Sign In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_on 'Sign in'
		expect(page).to have_content(user.email)
	end
end