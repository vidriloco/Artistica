class PromotedCategory < ApplicationRecord
  belongs_to :category
  
  def self.on_landing_page
    PromotedCategory.all.includes(:category => :artworks).where(visible: true).order('promoted_categories.order ASC')
  end
end
