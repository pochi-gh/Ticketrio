class Live < ApplicationRecord
  has_many :artist_lives
  has_many :artists, through: :artist_lives
end
