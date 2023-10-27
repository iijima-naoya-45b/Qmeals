class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development? || Rails.env.test? 
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'top_recipe.svg'
  end

  process resize_to_fill: [500, 500]
  process :quality => 85

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    original_filename if original_filename
  end

  private

  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage)
      img = yield(img) if block_given?
      img
    end
  end
end
