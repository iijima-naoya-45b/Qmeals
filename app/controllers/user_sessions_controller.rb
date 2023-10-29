# Userログイン確認コントローラ
class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :store_location

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました'
  end
end
