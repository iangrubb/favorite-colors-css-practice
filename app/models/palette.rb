class Palette < ApplicationRecord
  belongs_to :user
  
  has_many :palette_colors
  has_many :colors, through: :palette_colors
end
