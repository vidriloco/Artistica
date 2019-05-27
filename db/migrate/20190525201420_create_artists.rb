class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string      :slug, null: false
      t.string      :name, null: false
      t.string      :quote, null: false
      
      t.text        :bio
      t.date        :birth_date
      t.string      :birth_place, null: false
      
      t.boolean     :shows_contact_information
      t.string      :email
      t.string      :twitter_username
      t.string      :facebook_username
      t.string      :phone_number
      
      t.text        :list_of_tags
      
      t.attachment  :image
      
      t.timestamps
    end
    
    add_index :artists, :email, unique: true
    add_index :artists, :slug, unique: true
    
  end
end
