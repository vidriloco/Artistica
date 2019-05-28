class SitemapController < ApplicationController
  
  def index
    @endpoints = ['coleccion', 'obras', 'nuestra-coleccion', 'articulos-y-rutas']
    @artworks = Artwork.published
    @articles = Article.published
    @tags = Tag.all
    
    respond_to do |format|
      format.xml
    end
  end
  
end
