require "administrate/base_dashboard"

class ArtistDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tags: Field::HasMany,
    categories: Field::HasMany,
    id: Field::Number,
    slug: Field::String,
    name: Field::String,
    bio: EnrichedTextField,
    quote: Field::String,
    birth_date: Field::DateTime,
    birth_place: Field::String,
    twitter_username: Field::String,
    facebook_username: Field::String,
    phone_number: Field::String,
    email: Field::String,
    shows_contact_information: Field::Boolean,
    image: PaperclipField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :birth_place,
    :categories,
    :id,
    :slug,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :slug,
    :categories,
    :id,
    :bio,
    :quote,
    :image,
    :birth_date,
    :birth_place,
    :email,
    :shows_contact_information,
    :twitter_username,
    :facebook_username,
    :phone_number,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :bio,
    :quote,
    :categories,
    :image,
    :birth_date,
    :birth_place,
    :shows_contact_information,
    :email,
    :twitter_username,
    :facebook_username,
    :phone_number
  ].freeze

  # Overwrite this method to customize how artists are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(artist)
  #   "Artist ##{artist.id}"
  # end
end
