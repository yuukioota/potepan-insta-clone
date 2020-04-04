class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  
  accepts_nested_attributes_for :photos
  
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
  
  def self.search(search)
    return Post.all unless search
    Post.where(['caption LIKE ?', "%#{search}%"])
  end
end
