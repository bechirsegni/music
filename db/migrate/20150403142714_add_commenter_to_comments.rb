class AddCommenterToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter_type, :string
    add_column :comments, :commenter_id, :integer

    add_index :comments, [:commenter_id,:commenter_type]
    drop_table :scomments
  end
end
