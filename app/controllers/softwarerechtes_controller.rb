class SoftwarerechtesController < ApplicationController
  before_action :set_softwarerechte, only: [:show, :edit, :update, :destroy]

  # GET /softwarerechtes
  # GET /softwarerechtes.json
  def index
    @softwarerechtes = Softwarerechte.all
  end

  # GET /softwarerechtes/1
  # GET /softwarerechtes/1.json
  def show
    if current_rule.softwarerechte
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /softwarerechtes/new
  def new
    if current_rule.softwarerechte
        @softwarerechte = Softwarerechte.new      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # GET /softwarerechtes/1/edit
  def edit
    if current_rule.softwarerechte
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /softwarerechtes
  # POST /softwarerechtes.json
  def create
    @softwarerechte = Softwarerechte.new(softwarerechte_params)

    respond_to do |format|
      if @softwarerechte.save
        format.html { redirect_to @softwarerechte, notice: 'Softwarerechte was successfully created.' }
        format.json { render :show, status: :created, location: @softwarerechte }
      else
        format.html { render :new }
        format.json { render json: @softwarerechte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /softwarerechtes/1
  # PATCH/PUT /softwarerechtes/1.json
  def update
    respond_to do |format|
      if @softwarerechte.update(softwarerechte_params)
        format.html { redirect_to @softwarerechte, notice: 'Softwarerechte was successfully updated.' }
        format.json { render :show, status: :ok, location: @softwarerechte }
      else
        format.html { render :edit }
        format.json { render json: @softwarerechte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /softwarerechtes/1
  # DELETE /softwarerechtes/1.json
  def destroy
    if current_rule.softwarerechte
        @softwarerechte.destroy
    respond_to do |format|
      format.html { redirect_to softwarerechtes_url, notice: 'Softwarerechte was successfully destroyed.' }
      format.json { head :no_content }      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_softwarerechte
      @softwarerechte = Softwarerechte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def softwarerechte_params
      params.require(:softwarerechte).permit(:name, :beschreibung, :kasse_neuerKunde, :kasse_bezahlen, :kasse_ausgeben, :dreamspark_aufnehmen, :dreamspark_editiren, :drucken, :ausleihen_algemein, :ausleihen_laptop, :antrag_New, :antrag_Show, :antrag_delete, :antrag_edit, :antragtyp, :antragStatus, :datein_New, :datein_Show, :datein_delete, :datein_edit, :dateienKatigorie, :modul, :professor, :studiengang, :invetar_New, :invetar_Show, :invetar_delete, :invetar_edit, :member_New, :member_Show, :member_delete, :member_edit, :order_New, :order_Show, :order_delete, :order_edit, :orderStatus, :softwarerechte)
    end
end
