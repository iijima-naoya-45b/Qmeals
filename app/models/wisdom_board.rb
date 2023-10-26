class WisdomBoard < ApplicationRecord
  mount_uploader :photo, WisdomPhotoUploader
  belongs_to :user
  has_many :favorite_wisdoms, dependent: :destroy
  has_many :wisdom_type_of_tags, dependent: :destroy
  has_many :wisdom_tags, through: :wisdom_type_of_tags
  has_many :wisdom_photos, dependent: :destroy
  has_many :wisdom_comments, dependent: :destroy
end
