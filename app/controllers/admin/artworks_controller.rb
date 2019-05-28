module Admin
  class ArtworksController < Admin::ApplicationController    
    def permitted_attributes
      [{:category_ids=>[]}, :user_id, :artists, :disposition_on_landing_page, :published, :width, :height, :title, :year, :description, :location_lat, :location_lng, :image]
    end
  end
end
