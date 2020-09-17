class Live < ApplicationRecord
  has_many :artists, through: :artist_concerts
  has_many :artist_concerts
  has_many :tickets

  validates :title, presence: true
  validates :prefecture_id, presence: true
  validates :hall, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
