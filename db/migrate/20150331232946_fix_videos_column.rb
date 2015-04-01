class FixVideosColumn < ActiveRecord::Migration
  def change
    rename_column :videos, :video_id, :video_link
  end
end
