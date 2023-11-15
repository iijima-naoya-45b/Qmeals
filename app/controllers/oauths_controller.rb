class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if (@user = login_from(provider))
      flash[:success] = "#{provider.titleize}アカウントでログインしました"
      redirect_to root_path
    else
      begin
        signup_and_login(provider)
        flash[:success] = "#{provider.titleize}アカウントでログインしました"
        redirect_to root_path
      rescue
        flash[:danger] = "#{provider.titleize}アカウントでのログインに失敗しました"
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :error, :state)
  end

  def signup_and_login(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
