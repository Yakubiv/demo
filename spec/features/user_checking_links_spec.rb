require "spec_helper"

feature 'User profile' do
	background do
		sign_in_with 'petro@gmail.com', 'password'
	end
	scenario 'sees path link' do
	click_link 'PATH'
	expect(page).to have_content('Path page')
	end

	scenario 'sees maps link' do
		click_link 'MAPS'
		expect(page).to have_content('Map page')
	end

	scenario 'sees activites link' do
		click_link 'ACTIVITES'
		expect(page).to have_content('Activites')
	end

	scenario 'sees progress link' do
		click_link 'PROGRESS'
		expect(page).to have_content('Here you can see your progress')
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