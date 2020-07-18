class Admin::UsersController < AdminController
  def index
    @users = User.includes(:pre_registration)
  end
  def new
    @user = User.new
  end
  def create
    #@user = User.new(user_params)
    @user = User.create_with_password(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'Pre registration was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  private
  def set_user
    @use = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :pre_registration_id, :role)
  end

end
