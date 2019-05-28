class ArtistsController < ApplicationController
  layout 'artists'
  
  def show
    @artist = Artist.where(slug: params[:slug]).first
    
    redirect_to(root_path) && return if @artist.blank?
    
    @artworks = @artist.artworks.order('index ASC')
  end
end
