require "administrate/base_dashboard"

class SlideDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    style: Field::String,
    index: Field::Number,
    first_heading: Field::String,
    second_heading: Field::String,
    third_heading: Field::String,
    is_enabled: Field::Boolean,
    image_url: Field::String,
    url: Field::String,
    group: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    group_localized: Field::String,
    style_localized: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :style_localized,
    :first_heading,
    :second_heading,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :style_localized,
    :first_heading,
    :second_heading,
    :third_heading,
    :is_enabled,
    :url,
    :index,
    :group_localized,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :style,
    :index,
    :first_heading,
    :second_heading,
    :third_heading,
    :is_enabled,
    :url,
    :image_url,
    :group,
  ].freeze

  # Overwrite this method to customize how slides are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(slide)
  #   "Slide ##{slide.id}"
  # end
  
  def self.slider_groups
    Slide.groups_hash.map { |k, v| [v.capitalize, k] }
  end
  
  def self.slider_styles
    Slide.styles_hash.map { |k, v| [v.capitalize, k] }
  end
end
