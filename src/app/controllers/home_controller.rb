class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :after_login

  def top
  end
end
