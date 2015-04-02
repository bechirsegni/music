class Scomment < ActiveRecord::Migration
  def change
    create_table :scomments do |t|
      t.text :body
      t.integer :user_id
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
