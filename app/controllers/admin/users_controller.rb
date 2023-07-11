class Admin::UsersController < Admin::BaseController
  before_action :check_users, only: %i[edit update destroy]

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_users_path if @user.destroy
  end

  private

  def check_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
