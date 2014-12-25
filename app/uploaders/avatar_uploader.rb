# encoding: utf-8

class AvatarUploader < BaseUploader

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path('unknow.gif')
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process resize_to_fit: [100,100]
  end

end