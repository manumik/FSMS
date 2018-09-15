class AntragStatusesController < ApplicationController
  before_action :set_antrag_status, only: [:show, :edit, :update, :destroy]

  # GET /antrag_statuses
  # GET /antrag_statuses.json
  def index
    @antrag_statuses = AntragStatus.all
  end

  # GET /antrag_statuses/1
  # GET /antrag_statuses/1.json
  def show
    if current_rule.antragStatus
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /antrag_statuses/new
  def new
    if current_rule.antragStatus
        @antrag_status = AntragStatus.new     
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # GET /antrag_statuses/1/edit
  def edit
    if current_rule.antragStatus
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /antrag_statuses
  # POST /antrag_statuses.json
  def create
    @antrag_status = AntragStatus.new(antrag_status_params)

    respond_to do |format|
      if @antrag_status.save
        format.html { redirect_to @antrag_status, notice: 'Antrag status was successfully created.' }
        format.json { render :show, status: :created, location: @antrag_status }
      else
        format.html { render :new }
        format.json { render json: @antrag_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /antrag_statuses/1
  # PATCH/PUT /antrag_statuses/1.json
  def update
    respond_to do |format|
      if @antrag_status.update(antrag_status_params)
        format.html { redirect_to @antrag_status, notice: 'Antrag status was successfully updated.' }
        format.json { render :show, status: :ok, location: @antrag_status }
      else
        format.html { render :edit }
        format.json { render json: @antrag_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antrag_statuses/1
  # DELETE /antrag_statuses/1.json
  def destroy
    if current_rule.antragStatus
        @antrag_status.destroy
        respond_to do |format|
        format.html { redirect_to antrag_statuses_url, notice: 'Antrag status was successfully destroyed.' }
        format.json { head :no_content }
    end    
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antrag_status
      @antrag_status = AntragStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antrag_status_params
      params.require(:antrag_status).permit(:name, :beschreibung)
    end
end
