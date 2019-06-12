class ArtworksController < ApplicationController
  
  def show
    @artwork = Artwork.first_with_id_or_slug(params[:id], params[:slug])
    
    if @artwork.nil?
      redirect_to root_path
      return
    else
      @artist_artworks = ArtistArtwork.where.not(artwork_id: @artwork.id).where(artist_id: @artwork.artists).limit(6).includes(:artwork).group_by(&:artist)
    end
  end
  
  def index
    @artworks = Artwork.published.order('created_at DESC')
    @seo = SeoForPage.find_for_page('artworks-index-page')
  end
  
end
