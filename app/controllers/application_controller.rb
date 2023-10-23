class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger

  private

  def store_location
    session[:return_to] = request.url
  end

  def not_authenticated
    redirect_to login_path
  end
end
