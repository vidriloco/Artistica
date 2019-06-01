class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/admin'
  end
    
  def index
    @seo = SeoForPage.find_for_page('main-page')
    @slides = Slide.enabled_for(:landing)
    @article = Article.last
    @categories = PromotedCategory.on_artworks
    @artworks = Artwork.all_for(@categories).limit(10)
    @artists = Artist.all.limit(3)
  end
end
