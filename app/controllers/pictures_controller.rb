class PicturesController < ApplicationController
  
  def show
    @spot_picture = Picture.find(params[:id])
  end
  
  def index
    @pictures = Picture.published.order('created_at DESC')
    @seo = SeoForPage.find_for_page('pictures-index-page')
  end
  
end
