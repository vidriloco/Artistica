class ArtworksController < ApplicationController
  
  def show
    @artwork = Artwork.find(params[:id])
    @artist_artworks = ArtistArtwork.where.not(artwork_id: @artwork.id).where(artist_id: @artwork.artists).limit(6).includes(:artwork).group_by(&:artist)
  end
  
  def index
    @artworks = Artwork.published.order('created_at DESC')
    @seo = SeoForPage.find_for_page('artworks-index-page')
  end
  
end
