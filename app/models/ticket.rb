class Ticket < ApplicationRecord
  belongs_to :live
  belongs_to :user
end
