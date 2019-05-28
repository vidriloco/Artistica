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
    .joins(:categories).select('title', 'year', 'image_file_name', 'image_content_type', 'image_file_size', 'image_updated_at', 'created_at', 'disposition_on_landing_page').select(:id).distinct.where('categories.id' => categories.map(&:category_id), published: true)
  end
end
