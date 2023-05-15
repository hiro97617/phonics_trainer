class UserSessionsController < ApplicationController
  skip_before_action :require_login
  before_action :move_to_dashboard, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      flash[:success] = 'ログインに成功しました'
      redirect_back_or_to dashboard_path
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトに成功しました'
  end
end
