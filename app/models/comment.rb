class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :text, presence: true

end
