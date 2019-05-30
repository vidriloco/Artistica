class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string      :title
      t.string      :description
      t.integer     :artist_id
      t.timestamps
    end
  end
end
