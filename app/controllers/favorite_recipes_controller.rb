class FavoriteRecipesController < ApplicationController
  def index
    @favorite_recipes = current_user.favorite_recipes.includes(:recipe).map(&:recipe)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.recipe_favorite(@recipe)
  end

  def destroy
    @recipe = current_user.favorite_recipes.find(params[:id]).recipe
    current_user.recipe_unfavorite(@recipe)
  end
end
