class CreateArtistArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_artworks do |t|
      t.integer     :artist_id
      t.integer     :artwork_id
      t.integer     :index
      t.timestamps
    end
    
    add_index :artist_artworks, [:artist_id, :artwork_id], unique: true
  end
end
