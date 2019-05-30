class PromotedCategory < ApplicationRecord
  belongs_to :category
  
  def self.on_artworks
    PromotedCategory.all.includes(:category => :artworks).where(visible: true).order('promoted_categories.order ASC')
  end
end
