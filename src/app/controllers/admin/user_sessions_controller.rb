class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin

  layout 'layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to admin_root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = '管理者ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: 'ログアウトしました'
  end
end
