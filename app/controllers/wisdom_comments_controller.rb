class WisdomCommentsController < ApplicationController
  def create
    @comment = current_user.wisdom_comments.build(comment_params)
    @comment.save
  end

  def destroy
    @comment = current_user.wisdom_comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:wisdom_comment).permit(:comment).merge(wisdom_board_id: params[:wisdom_board_id])
  end
end
