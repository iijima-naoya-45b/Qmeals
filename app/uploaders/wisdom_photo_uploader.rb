class WisdomPhotoUploader < CarrierWave::Uploader::Base
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
    'top_wisdom.svg'
  end

  process resize_to_limit: [200, 200]

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    original_filename if original_filename
  end
end
