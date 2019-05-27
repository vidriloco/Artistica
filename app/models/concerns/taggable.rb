module Taggable    

  def assign_list_of_tags
    self.list_of_tags = categories.map(&:title).join(', ')
  end
  
  def parameterized_category_list
    categories.map(&:title).map(&:parameterize).join(' ')
  end
  
  def self.included(base)
    base.class_eval do
      has_many :tags, as: :taggable
      has_many :categories, through: :tags
  
      before_validation :assign_list_of_tags
    end
  end
end