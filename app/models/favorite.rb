class Favorite < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
end
