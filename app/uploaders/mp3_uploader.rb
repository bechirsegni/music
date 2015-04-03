# encoding: utf-8

class Mp3Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  process :set_content_type

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
