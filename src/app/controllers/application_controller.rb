class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, alert: "ログインをしてください"
  end

  def after_login
    redirect_to dashboard_path if logged_in?
  end
end
