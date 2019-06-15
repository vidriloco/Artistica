class ArtistArtwork < ApplicationRecord
  belongs_to :artist
  belongs_to :artwork
  
  scope :best_picks, -> { where(is_best_pick: true) }
end
