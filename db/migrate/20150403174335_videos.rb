class Videos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :video_link
      t.string :cover_image

      t.timestamps null: false
    end
  end
end
