class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string        :title
      t.text          :description
      t.integer       :user_id
      t.integer       :year      
      
      t.string        :credits
      t.float         :width
      t.float         :height
      
      t.string        :disposition_on_landing_page
      t.string        :published
      t.text          :list_of_tags
      t.timestamps
    end
  end
end
