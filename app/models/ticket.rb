class Ticket < ApplicationRecord
  has_many :lives
  has_many :users
end
