class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string        :slug, null: false
      t.string        :title
      t.text          :description
      t.integer       :year      
      
      t.string        :credits
      t.float         :width
      t.float         :height
      
      t.float         :price
      t.is_available  :boolean, default: false
      
      t.string        :disposition_on_landing_page
      t.boolean       :published
      t.text          :list_of_tags
            
      t.timestamps
    end
  end
end
