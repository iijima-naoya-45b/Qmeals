class WisdomBoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_wisdom_board, only: %i[show edit update destroy]

  def index
    @wisdom_boards = WisdomBoard.includes(:user).filtered_search(params[:title],
                                                                params[:tag]).order(created_at: :desc).page(params[:page])
  end

  def show
    @wisdom_board = WisdomBoard.find(params[:id])
    @comments = @wisdom_board.wisdom_comments.includes(:user).order(created_at: :desc)
    @comment = WisdomComment.new
  end

  def new
    @wisdom_form = WisdomForm.new({}, current_user)
  end

  def create
    @wisdom_form = WisdomForm.new(wisdom_form_params, current_user)

    if @wisdom_form.save
      redirect_to wisdom_boards_path, success: '投稿が成功しました'
    else
      flash.now[:danger] = '投稿できませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @wisdom_board.destroy!
    redirect_to wisdom_boards_path, danger: '料理の知恵袋の削除に成功しました.'
  end

  def favorite_wisdoms
    @favorite_wisdoms = current_user.favorite_wisdom_wisdoms.includes(:user).order(created_at: :desc)
  end

  private

  def set_wisdom_board
    @wisdom_board = WisdomBoard.find(params[:id])
  end

  def wisdom_form_params
    params.require(:wisdom_form).permit(
      :title,
      :content,
      :tag_name,
      :photo,
      wisdom_attributes: %i[id description]
    )
  end
end
