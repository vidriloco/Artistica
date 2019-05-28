class PopularController < ApplicationController
  def index
    @seo = SeoForPage.find_for_page('popular-index-page')
  end
end
