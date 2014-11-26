class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
  belongs_to :post
end
