class Artist < ApplicationRecord
  has_many :artist_lives
  has_many :live, through: :artist_lives
end
