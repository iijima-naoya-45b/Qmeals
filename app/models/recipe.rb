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
end
