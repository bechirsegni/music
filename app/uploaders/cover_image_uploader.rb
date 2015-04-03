# encoding: utf-8

class CoverImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  version :thumb do
    process :resize_to_limit => [150,150]
  end

  storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
