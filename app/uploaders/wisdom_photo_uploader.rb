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

  process resize_to_limit: [300, 300]

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    original_filename
  end

  private

  def optimize
    manipulate! do |img|
      img.strip
      img.combine_options do |c|
        c.quality '80'
        c.interlace 'Plane'
      end
      img
    end
  end
end
