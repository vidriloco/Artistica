class Picture < ApplicationRecord
  include Taggable
  include Imageable
  
  has_one :picture_in_section
  belongs_to :user
  
  validates :title, presence: true
  
  def self.published
    where(published: true)
  end
  
  def self.all_pictures_with(categories)
    Picture.order('pictures.created_at DESC').joins(:categories).select('title', 'year', 'image_file_name', 'image_content_type', 'image_file_size', 'image_updated_at', 'created_at', 'disposition_on_landing_page').select(:id).distinct.where('categories.id' => categories.map(&:category_id), 'published' => true)
  end
  
  def has_owner?
    !user.nil?
  end
end
