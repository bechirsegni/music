class Video < ActiveRecord::Base
  mount_uploader :cover_image, CoverImageUploader

  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
end
