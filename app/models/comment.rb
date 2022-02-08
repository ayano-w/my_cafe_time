class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cafe
  
  validates :comment, length: { maximum: 100 }
  
end
