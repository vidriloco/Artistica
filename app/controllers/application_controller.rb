class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/admin'
  end
    
  def index
    @seo = SeoForPage.find_for_page('main-page')
    @article = Article.last
    @categories = PromotedCategory.on_landing_page
    @pictures = Picture.all_pictures_with(@categories)
    @recent_pictures = Picture.order('created_at DESC').limit(8)
    @selected_pictures = [
      'https://images.unsplash.com/photo-1517516794485-082c4d03bb19?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80', 
      'https://images.unsplash.com/photo-1527620774867-0f15643667cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80',
      'https://images.unsplash.com/photo-1548020887-619fb11eb302?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
    ]
  end
end
