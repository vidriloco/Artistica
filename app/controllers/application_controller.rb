class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/admin'
  end
    
  def index
    @seo = SeoForPage.main
    @slides = Slide.enabled_for(:landing)
    @article = Article.last
    @categories = PromotedCategory.on_artworks
    @artwork_by_category = Artwork.all_for(@categories).limit(10)
    @picked_artworks = ArtistArtwork.best_picks.limit(5).order('created_at DESC').map(&:artwork)
    @artists = Artist.all.limit(3)
  end
end
