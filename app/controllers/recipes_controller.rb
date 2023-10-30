class RecipesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  def index
    @recipes = Recipe.includes(:user).filtered_search(params[:title],
                                                      params[:tag]).order(created_at: :desc).page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.recipe_comments.includes(:user).order(created_at: :desc)
    @comment = RecipeComment.new
    @shopping_list_items = @recipe.add_shopping_list_items(current_user)
  end

  def add_to_shopping_list
    @recipe = Recipe.find(params[:id])
    @shopping_list_items = @recipe.add_shopping_list_items(current_user)
    recipe_ingredient_names = @recipe.ingredients.pluck(:name)
    ingredient_name = params[:ingredient_name]

    if @shopping_list_items.include?(ingredient_name)
      flash[:danger] = 'この食材はすでにショッピングリストに追加されています。'
    else
      shopping_list_notes = @recipe.title
      current_user.shopping_lists.create(item: ingredient_name, notes: shopping_list_notes)
      flash[:success] = '食材をショッピングリストに追加しました。'
    end
    redirect_to recipe_path(@recipe)
  end

  def new
    @recipe_form = RecipeForm.new({}, current_user)
  end

  def create
    @recipe_form = RecipeForm.new(recipe_params, current_user)

    if @recipe.save
      image_params[:images].each do |image|
        ImageUploadJob.perform_later(@recipe.id, image)
      end
      redirect_to recipes_path, success: 'レシピが作成されました'
    else
      flash.now[:danger] = 'レシピを投稿できませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, success: 'レシピが削除されました'
  end

  def favorite_recipes
    @favorite_recipes = current_user.favorite_recipe_recipes.includes(:user).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe_form).permit(
      :title, :content, :cooking_time, :tag_name, :photo,
      ingredients_attributes: %i[id ingredient_name unit_unit],
      recipe_mains: %i[id image description]
    )
  end

  def shopping_list_item_params
    params.require(:shopping_list_item).permit(:item)
  end
end
