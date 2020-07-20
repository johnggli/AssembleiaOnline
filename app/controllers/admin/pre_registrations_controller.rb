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
    @apartments = set_apartments
  end

  # GET /pre_registrations/1/edit
  def edit
    @apartments = set_apartments
  end

  # POST /pre_registrations
  # POST /pre_registrations.json
  def create
    @pre_registration = PreRegistration.new(pre_registration_params)
    @apartments = set_apartments

    respond_to do |format|
    if @pre_registration.save
      format.html { redirect_to admin_pre_registrations_path, notice: 'Pre registration was successfully created.' }
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
    @apartments = set_apartments
    respond_to do |format|
      if @pre_registration.update(pre_registration_params)
        format.html { redirect_to admin_pre_registrations_path, notice: 'Pre registration was successfully updated.' }
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
      format.html { redirect_to admin_pre_registrations_path, notice: 'Pre registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_apartments
      [101, 102, 103, 104] +
      [201, 202, 203, 204] +
      [301, 302, 303, 304] +
      [401, 402, 403, 404] +
      [501, 502, 503, 504]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pre_registration
      @pre_registration = PreRegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pre_registration_params
      params.require(:pre_registration).permit(:cpf, :bloc, :ap)
    end

end
