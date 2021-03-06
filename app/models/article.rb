class Article < ApplicationRecord
  has_many :tags, as: :taggable
  has_many :categories, through: :tags
  belongs_to :user
  
  def self.published
    self.where(published: true)
  end
  
  def image_url
  end
  
  def has_owner?
    !user.nil?
  end
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
end
