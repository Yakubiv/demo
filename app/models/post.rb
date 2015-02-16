class Post < ActiveRecord::Base
	acts_as_taggable
	belongs_to :user
	has_many :favoriters, through: :favorites
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :tag_list, presence: false
	validate :validate_tag

	default_scope {order('created_at DESC')}

  def self.search(query)
    where('title ilike ? OR content ilike ?', "%#{query}%", "%#{query}%")
  end

  def validate_tag
    tag_list.each do |tag|
      errors.add(:tag, "должнен быть в пределе 3-15 символов") if tag.length > 15 || tag.length < 3
    end
  end

end
