class Ticket < ApplicationRecord
  belongs_to :live
  belongs_to :user
  has_many :comments
end
