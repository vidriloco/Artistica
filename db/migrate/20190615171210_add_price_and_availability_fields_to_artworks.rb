class AddPriceAndAvailabilityFieldsToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :price, :float
    add_column :artworks, :is_available, :boolean, default: true
  end
end
