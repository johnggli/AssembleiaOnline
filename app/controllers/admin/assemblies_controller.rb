class Admin::AssembliesController < AdminController
  before_action :set_assembly, only: [:show, :edit, :update, :destroy, :open_close_state]

  # GET /assemblies
  # GET /assemblies.json
  def index
    @assemblies = Assembly.all.page(params[:page]).per(5)
  end

  # GET /assemblies/1
  # GET /assemblies/1.json
  def show
  end

  # GET /assemblies/new
  def new
    @assembly = Assembly.new
  end

  # GET /assemblies/1/edit
  def edit
  end

  # POST /assemblies
  # POST /assemblies.json
  def create
    @assembly = Assembly.new(assembly_params)

    respond_to do |format|
      if @assembly.save
        flash[:success] = Assembly.model_name.human + ' ' + t('success.create')
        format.html { redirect_to admin_assembly_path(@assembly) }
        format.json { render :show, status: :created, location: @assembly }
      else
        format.html { render :new }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assemblies/1
  # PATCH/PUT /assemblies/1.json
  def update
    if params[:assembly][:checkbox_checked] == "1"
      @assembly.update(ata: nil)
    end
    respond_to do |format|
      if @assembly.update(assembly_params)
        flash[:success] = Assembly.model_name.human + ' ' + t('success.update')
        format.html { redirect_to admin_assembly_path(@assembly) }
        format.json { render :show, status: :ok, location: @assembly }
      else
        format.html { render :edit }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assemblies/1
  # DELETE /assemblies/1.json
  def destroy
    @assembly.destroy
    respond_to do |format|
      flash[:success] = Assembly.model_name.human + ' ' + t('success.delete')
      format.html { redirect_to admin_assemblies_path }
      format.json { head :no_content }
    end
  end

  def open_close_state
    @assembly.state == "open" ? @assembly.state = :close : @assembly.state = :open
    if @assembly.save
      render json: { success: true, state: @assembly.state }
    else
      render json: { success: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly
      @assembly = Assembly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assembly_params
      params.require(:assembly).permit(:title, :start_time, :finish_time, :description, :state, :topics_count, :ata)
    end
end
