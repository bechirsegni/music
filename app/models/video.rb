class Video < ActiveRecord::Base
  has_attached_file :cover_image, :styles => { :medium => "373x178>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
end
