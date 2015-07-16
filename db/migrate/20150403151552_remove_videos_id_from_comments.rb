class RemoveVideosIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :video_id
  end
end
