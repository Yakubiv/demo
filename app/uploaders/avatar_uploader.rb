# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


 def extension_white_list
    %w(jpg jpeg gif png)
 end

  version :thumb do
    process :resize_to_fill => [50,50]
  end
  version :big_thumb do
    process :resize_to_fill => [100,100]
  end

end

