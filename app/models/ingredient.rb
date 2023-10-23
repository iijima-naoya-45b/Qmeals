class Ingredient < ApplicationRecord
  has_one :unit, dependent: :destroy
  has_many :recipe_ingredient, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
end
