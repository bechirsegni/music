class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :video_id

      t.timestamps null: false
    end
  end
end
