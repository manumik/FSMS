class LagersController < ApplicationController
  before_action :set_lager, only: [:show, :edit, :update, :destroy]

  # GET /lagers
  # GET /lagers.json
  def index
    @lagers = Lager.all
    @datensAll = Daten.all
  end

  # GET /lagers/1
  # GET /lagers/1.json
  def show
    @datensAll = Daten.all
    if current_rule.drucken
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /lagers/new
  def new
    if current_rule.drucken
        @lager = Lager.new 
        @lager.docAnzahl = 0
        @lager.inhalt = 0   
    else
        redirect_to root_path alert: "Keine Recht"
    end
 end

  # GET /lagers/1/edit
  def edit
    if current_rule.drucken
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /lagers
  # POST /lagers.json
  def create
    @lager = Lager.new(lager_params)

    respond_to do |format|
      if @lager.save
        format.html { redirect_to @lager, notice: 'Lager was successfully created.' }
        format.json { render :show, status: :created, location: @lager }
      else
        format.html { render :new }
        format.json { render json: @lager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lagers/1
  # PATCH/PUT /lagers/1.json
  def update
    respond_to do |format|
      if @lager.update(lager_params)
        format.html { redirect_to @lager, notice: 'Lager was successfully updated.' }
        format.json { render :show, status: :ok, location: @lager }
      else
        format.html { render :edit }
        format.json { render json: @lager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lagers/1
  # DELETE /lagers/1.json
  def destroy
    if current_rule.drucken
        @lager.destroy
        respond_to do |format|
      format.html { redirect_to lagers_url, notice: 'Lager was successfully destroyed.' }
      format.json { head :no_content }
    end      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lager
      @lager = Lager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lager_params
      params.require(:lager).permit(:name, :beschreibung, :dateiORkunde, :inhalt, :docAnzahl)
    end
end
