class Picture < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  has_one :picture_in_section
  belongs_to :user
  
  before_validation :assign_list_of_tags
    
  validates :title, presence: true
  validates :image, attachment_presence: true
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def self.published
    where(published: true)
  end
  
  def self.all_pictures_with(categories)
    Picture.order('pictures.created_at DESC').joins(:categories).select('title', 'year', 'image_file_name', 'image_content_type', 'image_file_size', 'image_updated_at', 'created_at', 'disposition_on_landing_page').select(:id).distinct.where('categories.id' => categories.map(&:category_id), 'published' => true)
  end
  
  def assign_list_of_tags
    self.list_of_tags = categories.map(&:title).join(', ')
  end
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
  
  def has_owner?
    !user.nil?
  end
  
  def url
    image_url
  end
  
  def image_url
    unless image.blank?
      if image.url[0,2] == "//"
        "http:#{image.url}"
      else
        image.url
      end
    else
      ""
    end
  end
end
