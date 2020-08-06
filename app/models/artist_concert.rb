class ArtistConcert < ApplicationRecord
  belongs_to :artist
  belongs_to :live
end
