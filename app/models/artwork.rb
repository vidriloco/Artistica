class Artwork < ApplicationRecord
  include Taggable
  include Imageable
    
  has_many :artist_artworks
  has_many :artists, through: :artist_artworks
  has_many :inquiries
  
  validates :title, presence: true
  
  before_validation :assign_slug
  
  scope :published, -> { where(published: true) }
  
  def self.first_with_id_or_slug(id, slug)
    rel = self.arel_table
    self.where(rel[:id].eq(id).or(rel[:slug].eq(slug))).first
  end
  
  def self.all_for(categories)
    Artwork.order('artworks.created_at DESC')
    .joins(:categories).select('title', 'year', 'created_at', 'disposition_on_landing_page', 'slug').select(:id).distinct.where('categories.id' => categories.map(&:category_id), published: true)
  end
  
  def escaped_details
    description.eql?("<p></p>") ? nil : description.html_safe
  end
  
  def comma_separated_artists
    artists.map(&:name).join(", ")
  end
  
  def title_for_seo
    "#{title} por #{comma_separated_artists} - Artistica: galería en la nube"
  end
    
  protected
  
  def assign_slug
    self.slug = title.parameterize
  end
end
