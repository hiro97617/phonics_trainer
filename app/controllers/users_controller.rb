class UsersController < ApplicationController
  skip_before_action :require_login
  before_action :move_to_dashboard

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '新規登録しました'
    else
      flash.now[:danger] = '新規登録に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
