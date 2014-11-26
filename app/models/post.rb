class Post < ActiveRecord::Base
	belongs_to :user
	has_many :favoriters, through: :favorites
	has_many :favorites, dependent: :destroy
	validates :user_id, presence: true
	has_many :comments, dependent: :destroy
end
