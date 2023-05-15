class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, warning: "ログインをしてください"
  end

  def move_to_dashboard
    redirect_to dashboard_path if logged_in?
  end
end
