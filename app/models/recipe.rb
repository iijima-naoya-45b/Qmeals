class Recipe < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :recipe_comments, dependent: :destroy
  has_many :recipe_type_of_tags, dependent: :destroy
  has_many :recipe_tags, through: :recipe_type_of_tags
  has_many :favorite_recipes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_photos, dependent: :destroy

  scope :search_title, ->(title) { where('recipes.title LIKE ?', "%#{title}%") }
  scope :search_tag, ->(tag) { joins(:recipe_tags).where('recipe_tags.name LIKE ?', "%#{tag}%") }

  scope :filtered_search, lambda { |title, tag|
    query = all
    query = query.search_title(title) if title.present?
    query = query.search_tag(tag) if tag.present?
    query
  }

  def add_shopping_list_items(current_user)
    current_user&.shopping_lists&.pluck(:item) || []
  end
end
