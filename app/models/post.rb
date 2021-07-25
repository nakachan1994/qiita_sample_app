class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :image

  # validates :image, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  # userがいいねしてるか確認
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
