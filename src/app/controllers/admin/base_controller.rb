class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_login

  private

  def require_login
  end
end
