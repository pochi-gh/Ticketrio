class Live < ApplicationRecord
  has_many :artist_lives
  has_many :artists, through: :artist_lives
  has_many :tickets

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
