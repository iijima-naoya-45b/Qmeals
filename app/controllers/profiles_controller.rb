class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def show; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'ユーザーの更新完了'
    else
      flash.now[:danger] = 'ユーザー更新に失敗しました'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar, :avatar_cache)
  end
end
