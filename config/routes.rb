Rails.application.routes.draw do
  get "/sitemap.xml" => "sitemap#index", :format => "xml", :as => :sitemap
  
  devise_for :users
  namespace :admin do
    resources :artists
    resources :artist_artworks
    resources :categories
    resources :articles
    resources :users
    resources :promoted_categories
    resources :seo_for_pages
    resources :slides
    resources :artworks
    resources :achievements
    root to: "artworks#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  
  get '/artistas', to: 'artists#index', as: 'artists'
  get '/artistas/:slug', to: 'artists#show', as: 'artist'
  
  get '/nuestra-coleccion', to: redirect('coleccion')
  get '/tags/:slug', to: 'tags#show', as: 'tag'
  
  get '/obras', to: 'artworks#index', as: 'artworks'
  get '/obras/:id(/:slug)', to: 'artworks#show', as: 'artwork'
  
  #get '/articulos-y-rutas', to: 'articles#index', as: 'articles'
  #get '/articulos-y-rutas/:id(/:name)', to: 'articles#show', as: 'article'
end
