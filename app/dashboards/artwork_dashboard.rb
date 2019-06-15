require "administrate/base_dashboard"

class ArtworkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tags: Field::HasMany,
    categories: Field::HasMany,
    artists: Field::HasMany,
    disposition_on_landing_page: Field::Select.with_options(collection: ['portraits', 'wide', 'grid-sizer portrait']),
    id: Field::Number,
    title: Field::String,
    year: Field::Number,
    description: Field::Text,
    published: Field::Boolean,
    price: Field::Number,
    is_available: Field::Boolean,
    width: Field::Number,
    height: Field::Number,
    image: AttachedField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    list_of_tags: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :price,
    :is_available,
    :list_of_tags,
    :image
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :list_of_tags,
    :id,
    :year,
    :price,
    :is_available,
    :published,
    :width,
    :height,
    :description,
    :image,
    :artists,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :description,
    :price,
    :is_available,
    :width,
    :height,
    :disposition_on_landing_page,
    :image,
    :year,
    :categories,
    :published,
    :artists
  ].freeze

  # Overwrite this method to customize how pictures are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(artwork)
    artwork.title
  end
end
