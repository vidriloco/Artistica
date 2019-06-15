class AddsIsBestPickToArtistArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artist_artworks, :is_best_pick, :boolean, default: false
  end
end
