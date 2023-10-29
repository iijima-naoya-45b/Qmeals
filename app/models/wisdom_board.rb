class WisdomBoard < ApplicationRecord
  mount_uploader :photo, WisdomPhotoUploader
  belongs_to :user
  has_many :favorite_wisdoms, dependent: :destroy
  has_many :wisdom_type_of_tags, dependent: :destroy
  has_many :wisdom_tags, through: :wisdom_type_of_tags
  has_many :wisdom_photos, dependent: :destroy
  has_many :wisdom_comments, dependent: :destroy

  scope :search_title, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :search_tag, ->(tag) { joins(:wisdom_tags).where('wisdom_tags.name LIKE ?', "%#{tag}%") }

  scope :filtered_search, lambda { |title, tag|
    query = all
    query = query.search_title(title) if title.present?
    query = query.search_tag(tag) if tag.present?
    query
  }
end
