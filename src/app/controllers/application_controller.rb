class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, alert: "ログインをしてください"
  end

  def move_to_dashboard
    redirect_to dashboard_path if logged_in?
  end
end
