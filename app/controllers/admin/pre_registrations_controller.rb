class Admin::PreRegistrationsController < AdminController
  before_action :set_pre_registration, only: [:show, :edit, :update, :destroy]


  # GET /pre_registrations
  # GET /pre_registrations.json
  def index
    @pre_registrations = PreRegistration.all
  end

  # GET /pre_registrations/1
  # GET /pre_registrations/1.json
  def show
  end

  # GET /pre_registrations/new
  def new
    @pre_registration = PreRegistration.new
  end

  # GET /pre_registrations/1/edit
  def edit
  end

  # POST /pre_registrations
  # POST /pre_registrations.json
  def create
    @pre_registration = PreRegistration.new(pre_registration_params)

    respond_to do |format|
    if @pre_registration.save
      flash[:success] = "Pre registration was successfully created."
      format.html { redirect_to admin_pre_registrations_path }
        format.json { render :show, status: :created, location: @pre_registration }
      else
        format.html { render :new }
        format.json { render json: @pre_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_registrations/1
  # PATCH/PUT /pre_registrations/1.json
  def update
    respond_to do |format|
      if @pre_registration.update(pre_registration_params)
        flash[:success] = "Pre registration was successfully updated."
        format.html { redirect_to admin_pre_registrations_path }
        format.json { render :show, status: :ok, location: @pre_registration }
      else
        format.html { render :edit }
        format.json { render json: @pre_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_registrations/1
  # DELETE /pre_registrations/1.json
  def destroy
    @pre_registration.destroy
    respond_to do |format|
      flash[:success] = "Pre registration was successfully destroyed."
      format.html { redirect_to admin_pre_registrations_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_registration
      @pre_registration = PreRegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pre_registration_params
      params.require(:pre_registration).permit(:cpf, :bloc, :ap)
    end

end
