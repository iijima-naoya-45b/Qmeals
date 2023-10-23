class RecipeTag < ApplicationRecord
  has_many :recipe_type_of_tags, dependent: :destroy
  has_many :recipes, through: :recipe_type_of_tags

  validates :name, uniqueness: true
end
