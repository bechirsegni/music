# encoding: utf-8

class CoverImageUploader < CarrierWave::Uploader::Base
  storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
