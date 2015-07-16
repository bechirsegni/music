class Video < ActiveRecord::Base

  #For Carrierwave
  mount_uploader :cover_image, CoverImageUploader
  validates_presence_of :cover_image

  #For Tables Relations
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
end
