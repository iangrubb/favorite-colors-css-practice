class Favorite < ApplicationRecord
  belongs_to :color
  belongs_to :user
end
