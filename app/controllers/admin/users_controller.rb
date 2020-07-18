class Admin::UsersController < AdminController
  def index
    @users = User.includes(:pre_registration)
  end
  def new
    @user = User.new
  end
  private
end
