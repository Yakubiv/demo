class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :post

  default_scope {order('created_at DESC')}
end
