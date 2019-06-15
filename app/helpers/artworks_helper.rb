module ArtworksHelper
  def tags_for(artwork)
    category_list = ""
    artwork.categories.each do |category|
      category_list << link_to(category.title, tag_path(category.title.parameterize)).concat(", ")
    end
    category_list.chop.chop.html_safe
  end
  
  def pricing_for(artwork)
    if artwork.is_available?
      if artwork.price.blank?
        "Precio no publicado"
      else
        "$#{artwork.price} MXN"
      end
    else
      "Vendido / No disponible"
    end
  end
end
