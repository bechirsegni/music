class AddAttachmentCoverImageToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :videos, :cover_image
  end
end
