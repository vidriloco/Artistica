class ArtistsController < ApplicationController
  layout 'artists'
  
  def show
    @artist = Artist.where(slug: params[:slug]).first
    @artworks = @artist.artworks.order('index ASC')
    
    if @artist.blank?
      redirect_to root_path
    end
  end
end
