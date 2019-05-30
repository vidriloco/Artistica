class ArtistsController < ApplicationController
  layout 'artists'
  
  def show
    @artist = Artist.where(slug: params[:slug]).includes([:artworks, :achievements]).first
    
    redirect_to(root_path) && return if @artist.blank?
    
    @categories = PromotedCategory.on_artworks
    @artworks = @artist.artworks.order('index ASC')
  end
end
