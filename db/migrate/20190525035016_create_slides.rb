class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.string      :style
      t.integer     :index
      t.string      :first_heading
      t.string      :second_heading
      t.string      :third_heading
      t.boolean     :is_enabled
      t.string      :url
      t.string      :image_url
      t.string      :group
      t.timestamps
    end
  end
end
