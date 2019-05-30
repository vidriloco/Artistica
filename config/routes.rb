Rails.application.routes.draw do
  get "/sitemap.xml" => "sitemap#index", :format => "xml", :as => :sitemap
  
  devise_for :users
  namespace :admin do
    resources :artists
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
  
  get '/artistas/:slug', to: 'artists#show', as: 'artista'
  get '/nuestra-coleccion', to: redirect('coleccion')
  get '/obras', to: redirect('/coleccion')
  get '/obras/:id(/:name)', to: 'artworks#show', as: 'artwork'
  get '/tags/:slug', to: 'tags#show', as: 'tag'
  get '/coleccion', to: 'artworks#index', as: 'artworks'
  get '/articulos-y-rutas', to: 'articles#index', as: 'articles'
  get '/articulos-y-rutas/:id(/:name)', to: 'articles#show', as: 'article'
end
