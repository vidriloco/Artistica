class PictureInSection < ApplicationRecord
  belongs_to :artwork
  
  before_save :adapt_sections
end
