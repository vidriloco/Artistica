module Imageable
  def self.included(base)
    base.class_eval do
      validates :image, attachment_presence: true
  
      has_attached_file :image, default_url: "/images/:style/missing.png"
      validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    end
  end
  
  def url
    image_url
  end
  
  def image_url
    return "" if image.blank?
    
    if image.url[0,2] == "//"
      "http:#{image.url}"
    else
      image.url
    end
  end
end