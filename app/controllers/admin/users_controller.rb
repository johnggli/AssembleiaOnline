class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy, :set_paid, :set_not_paid]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create_with_password(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = User.model_name.human + ' ' + t('success.create')
        format.html { redirect_to admin_users_path }
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
        flash[:success] = User.model_name.human + ' ' + t('success.update')
        format.html { redirect_to admin_users_path }
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
      flash[:success] = User.model_name.human + ' ' + t('success.delete')
      format.html { redirect_to admin_users_path }
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

  def search
    data = PreRegistration.find(params[:id])
    if(data.present?)
      render json: {
        id: data.id, cpf: data.cpf, bloc: data.bloc, ap: data.ap 
      }
    else
      render json: { error: true}
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :pre_registration_id, :role, :paid, :cpf, :ap, :bloc)
  end

end
