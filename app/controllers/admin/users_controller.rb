class Admin::UsersController < AdminController

  before_action :set_user, only: [:edit, :update, :destroy, :set_paid, :set_not_paid]

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
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_paid
    @user.update(paid: true)
    redirect_to admin_users_path
  end

  def set_not_paid
    @user.update(paid: false)
    redirect_to admin_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :pre_registration_id, :role, :paid)
  end

end
