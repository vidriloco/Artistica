module ApplicationHelper
  
  def generic_title_helper
    "Artistica: galería en la nube"
  end
  
  def current_route 
    request.env['PATH_INFO']
  end
  
  def seo_for_title(object)
    return generic_title_helper if object.nil?
    
    if object.is_a?(Artwork)
      object.title_for_seo
    else
      object.title
    end
  end
  
  def year_tag_for(year)
    return nil if year.blank?
    year
  end
  
  def seo_for_url(object)
    if object.is_a? SeoForPage
      object.url
    else
      "#{request.env['HTTP_HOST']}#{request.env['PATH_INFO']}"
    end
  end
  
  def seo_for_description(object)
    if object.is_a?(SeoForPage) || object.is_a?(Artwork)
      object.description
    else
      object.content
    end
  end
  
  def seo_for_keywords(object)
    if object.is_a? SeoForPage
      object.keywords
    else
      object.parameterized_category_list.split(" ").join(", ")
    end
  end
  
  def seo_for_image_url(object)
    return nil if object.nil?
    
    if object.is_a?(Artist) or object.is_a?(Artwork)
      url_for(object.image) 
    else
      object.image
    end
  end
end
