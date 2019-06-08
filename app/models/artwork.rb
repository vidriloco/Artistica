class Artwork < ApplicationRecord
  include Taggable
  include Imageable
    
  has_many :artist_artworks
  has_many :artists, through: :artist_artworks
  
  validates :title, presence: true
  
  def self.published
    where(published: true)
  end
  
  def self.all_for(categories)
    Artwork.order('artworks.created_at DESC')
    .joins(:categories).select('title', 'year', 'created_at', 'disposition_on_landing_page').select(:id).distinct.where('categories.id' => categories.map(&:category_id), published: true)
  end
  
  def escaped_details
    description.eql?("<p></p>") ? nil : description.html_safe
  end
end
