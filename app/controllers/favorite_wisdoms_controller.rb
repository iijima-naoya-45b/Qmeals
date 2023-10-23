class FavoriteWisdomsController < ApplicationController
  def index
    @favorite_wisdoms = current_user.favorite_wisdoms.includes(:wisdom_board).map(&:wisdom_board)
  end

  def create
    @wisdom_board = WisdomBoard.find(params[:wisdom_board_id])
    current_user.wisdom_board_favorite(@wisdom_board)
  end

  def destroy
    @wisdom_board = current_user.favorite_wisdoms.find(params[:id]).wisdom_board
    current_user.wisdom_board_unfavorite(@wisdom_board)
  end
end
