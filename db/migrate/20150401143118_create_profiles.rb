class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :location
      t.string :about
      t.text :description
      t.string :twitter
      t.string :facebook
      t.string :google

      t.timestamps null: false
    end
  end
end
