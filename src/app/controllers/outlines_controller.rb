class OutlinesController < ApplicationController
  skip_before_action :require_login

  def static_page; end
end
