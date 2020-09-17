class Ticket < ApplicationRecord
  belongs_to :live
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :seat, presence: true
  validates :piece, presence: true
  validates :price, presence: true
  validates :text, presence: true

end
