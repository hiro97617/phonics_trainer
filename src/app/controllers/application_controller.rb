class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  before_action :set_locale

  private

  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    options.merge(locale: locale)
  end

  def not_authenticated
    redirect_to login_path, warning: "ログインをしてください"
  end

  def move_to_dashboard
    redirect_to dashboard_path if logged_in?
  end
end
