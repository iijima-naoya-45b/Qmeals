class RecipeImageUploader < CarrierWave::Uploader::Base
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

  process resize_to_fill: [800, 600]

  process :optimize

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
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
