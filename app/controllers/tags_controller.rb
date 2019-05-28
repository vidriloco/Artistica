class TagsController < ApplicationController
  def show
    @category = Category.where(slug: params[:slug]).joins(:artworks).first
    @artworks = @category.artworks
  end
end
