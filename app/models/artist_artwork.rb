class ArtistArtwork < ApplicationRecord
  belongs_to :artist
  belongs_to :artwork
end
