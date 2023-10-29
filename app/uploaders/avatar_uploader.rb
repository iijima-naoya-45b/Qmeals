class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fill: [80, 80]
  process :optimize

  storage :fog

  def store_dir
    "uploads/#{model.class.model_name.singular}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'profile.svg'
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  private

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end

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
