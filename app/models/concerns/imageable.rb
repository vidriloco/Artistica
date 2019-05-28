module Imageable
  def self.included(base)
    base.class_eval do
      validates :image, presence: true
      has_one_attached :image
    end
  end
  
  def url
    image_url
  end
  
  def image_url
    image
  end
end