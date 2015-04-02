class Song < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    mount_uploader :mp3, Mp3Uploader
    belongs_to :user
end
