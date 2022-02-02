class Cafe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  attachment :tea_image
  validates :tea, presence: true, length: { maximum: 15 }
  validates :teacake, length: { maximum: 15 }
  validates :tea_image, presence: true
  validates :comment, length: { maximum: 100 }

  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end

end
