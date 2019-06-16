class Artist < ApplicationRecord
  include Taggable
  include Imageable
  
  has_many :artist_artworks
  has_many :artworks, through: :artist_artworks
  has_many :achievements
  
  validates :name, :slug, :quote, :birth_place, :email, presence: true
  validates :slug, uniqueness: true
  validates :email, uniqueness: true
    
  before_validation :assign_slug
  
  def title
    "#{name} artista en Artistica: galería en la nube"
  end
  
  def content
    bio
  end
  
  protected
  
  def assign_slug
    self.slug = name.parameterize
  end
end
