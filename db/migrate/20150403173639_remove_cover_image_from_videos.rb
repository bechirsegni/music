class RemoveCoverImageFromVideos < ActiveRecord::Migration
  def change
    drop_table :videos
  end
end
