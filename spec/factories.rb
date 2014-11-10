FactoryGirl.define do
	factory :user, aliases:[:author] do
		password 'password'
		email {'petro.yakubiv@gmail.com'}
	end
	factory :post do
		author
		#association :author, factory: :user, strategy: :build
		title 'New shpora'
		content 'A lot of words'
	end
end