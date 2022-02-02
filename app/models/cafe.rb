class Cafe < ApplicationRecord
  belongs_to :user
  attachment :tea_image
  validates :tea, presence: true, length: { maximum: 15 }
  validates :teacake, length: { maximum: 15 }
  validates :tea_image, presence: true
  validates :comment, length: { maximum: 20 }

  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end

end
