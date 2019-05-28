class Artist < ApplicationRecord
  include Taggable
  include Imageable
  
  has_many :artist_artworks
  has_many :artworks, through: :artist_artworks
  
  validates :name, :slug, :quote, :birth_place, :email, presence: true
  validates :slug, uniqueness: true
  validates :email, uniqueness: true
    
  before_validation :assign_slug
  
  protected
  
  def assign_slug
    self.slug = name.parameterize
  end
end
