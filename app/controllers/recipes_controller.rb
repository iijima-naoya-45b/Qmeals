class RecipesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  def index
    if params[:title].present? && params[:tag].present?
      @recipes = Recipe.joins(:recipe_tags).where('recipes.title LIKE ? AND recipe_tags.name LIKE ?', "%#{params[:title]}%",
                                                  "%#{params[:tag]}%").order('recipes.created_at DESC').page(params[:page])
    elsif params[:title].present?
      @recipes = Recipe.where('title LIKE ?', "%#{params[:title]}%").order(created_at: :desc).page(params[:page])
    elsif params[:tag].present?
      @recipes = Recipe.joins(:recipe_tags).where('recipe_tags.name LIKE ?',
                                                  "%#{params[:tag]}%").order('recipes.created_at DESC').page(params[:page])
    else
      @recipes = Recipe.includes(:user).page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @recipe = Recipe.includes(:user, :recipe_comments, :recipe_tags, :ingredients).find(params[:id])
    @comments = @recipe.recipe_comments.includes(:user).order(created_at: :desc)
    @comment = RecipeComment.new
  end

  def new
    @recipe_form = RecipeForm.new({}, current_user)
  end

  def create
    @recipe_form = RecipeForm.new(recipe_params, current_user)

    if @recipe_form.save
      redirect_to recipes_path, success: 'レシピが作成されました'
    else
      flash.now[:danger] = 'レシピを投稿できませんでした'
      render :new
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
end
