class RecipeCommentsController < ApplicationController
  def create
    @comment = current_user.recipe_comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = current_user.recipe_comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:recipe_comment).permit(:body).merge(recipe_id: params[:recipe_id])
  end
end
