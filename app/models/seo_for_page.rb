class SeoForPage < ApplicationRecord
    
  module PageIds
    MAIN = "main-page"
    ARTISTS_INDEX = "artists-index-page"
    ARTWORKS_INDEX = "artworks-index-page"
  end
  
  def self.main
    self.find_for_page(PageIds::MAIN)
  end
  
  def self.artists
    self.find_for_page(PageIds::ARTISTS_INDEX)
  end
  
  def self.artworks
    self.find_for_page(PageIds::ARTWORKS_INDEX)
  end
  
  def self.available_pages
    [PageIds::MAIN, PageIds::ARTISTS_INDEX, PageIds::ARTWORKS_INDEX]
  end
  
  def self.find_for_page(route)
    self.where(page_identifier: route).first
  end
  
  def image
    image_url
  end
end
