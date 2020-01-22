class User < ApplicationRecord
    has_many :palettes

    has_many :favorites
    has_many :colors, through: :favorites

end
