class Artist < ApplicationRecord
  has_many :lives, through: :artist_concerts
  has_many :artist_concerts
  
  validates :artist_name, presence: true, uniqueness: true
end
