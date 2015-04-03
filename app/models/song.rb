require 'file_size_validator'
class Song < ActiveRecord::Base
    #For Carrierwave
    mount_uploader :image, ImageUploader
    mount_uploader :mp3, Mp3Uploader
    validates_presence_of :image
    validates :mp3,
              :presence => true,
              :file_size => {
                  :maximum => 5.megabytes.to_i
              }

    #For Tables Relations
    belongs_to :user , dependent: :destroy
    has_many :category, dependent: :destroy
    has_many :scomments, dependent: :destroy
end
