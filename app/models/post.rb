class Post < ActiveRecord::Base
	belongs_to :user
	has_many :favoriters, through: :favorites
	has_many :favorites
end
