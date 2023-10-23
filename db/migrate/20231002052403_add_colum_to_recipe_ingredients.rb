class AddColumToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_ingredients, :ingredient, foreign_key: true
  end
end
