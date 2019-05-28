class ArtworksController < ApplicationController
  
  def show
    @artwork = Artwork.find(params[:id])
  end
  
  def index
    @artworks = Artwork.published.order('created_at DESC')
    @seo = SeoForPage.find_for_page('artworks-index-page')
  end
  
end
