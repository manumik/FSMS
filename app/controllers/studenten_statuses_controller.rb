class StudentenStatusesController < ApplicationController
  before_action :set_studenten_status, only: [:show, :edit, :update, :destroy]

  # GET /studenten_statuses
  # GET /studenten_statuses.json
  def index
    @studenten_statuses = StudentenStatus.all
  end

  # GET /studenten_statuses/1
  # GET /studenten_statuses/1.json
  def show
    if current_rule.softwarerechte
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /studenten_statuses/new
  def new
    if current_rule.softwarerechte
        @studenten_status = StudentenStatus.new      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # GET /studenten_statuses/1/edit
  def edit
    if current_rule.softwarerechte
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /studenten_statuses
  # POST /studenten_statuses.json
  def create
    @studenten_status = StudentenStatus.new(studenten_status_params)

    respond_to do |format|
      if @studenten_status.save
        format.html { redirect_to @studenten_status, notice: 'Studenten status was successfully created.' }
        format.json { render :show, status: :created, location: @studenten_status }
      else
        format.html { render :new }
        format.json { render json: @studenten_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studenten_statuses/1
  # PATCH/PUT /studenten_statuses/1.json
  def update
    respond_to do |format|
      if @studenten_status.update(studenten_status_params)
        format.html { redirect_to @studenten_status, notice: 'Studenten status was successfully updated.' }
        format.json { render :show, status: :ok, location: @studenten_status }
      else
        format.html { render :edit }
        format.json { render json: @studenten_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studenten_statuses/1
  # DELETE /studenten_statuses/1.json
  def destroy
    if current_rule.softwarerechte
        @studenten_status.destroy
    respond_to do |format|
      format.html { redirect_to studenten_statuses_url, notice: 'Studenten status was successfully destroyed.' }
      format.json { head :no_content }
    end      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studenten_status
      @studenten_status = StudentenStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studenten_status_params
      params.require(:studenten_status).permit(:status)
    end
end
