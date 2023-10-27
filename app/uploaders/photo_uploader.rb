class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'top_recipe.svg'
  end

  process resize_to_fit: [300, 300]
  process :optimize

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  private

  def optimize
    manipulate! do |img|
      img.strip
      img.combine_options do |c|
        c.quality "80"
        c.interlace "Plane"
      end
      img
    end
  end

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
