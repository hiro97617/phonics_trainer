class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :move_to_dashboard

  def top
  end
end
