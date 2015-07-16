class AddTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :video_id

      t.timestamps null: false
    end
  end
end
