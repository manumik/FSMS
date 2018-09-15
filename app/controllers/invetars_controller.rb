class InvetarsController < ApplicationController
  before_action :set_invetar, only: [:show, :edit, :update, :destroy]

  # GET /invetars
  # GET /invetars.json
  def index
    @invetars = Invetar.all
    @invetar_typs = InvetarTyp.all
  end

  def hub
    @invetars = Invetar.all
    @invetar_typs = InvetarTyp.all
    @invetar_zuruek = Invetar.where("backat < ? and kunden > ?", Time.now, 0)
    @kunden = Student.all
  end

  def ausleihen
    @invetar_typs = InvetarTyp.find(params[:id])
    objekt = Invetar.find_by(typ: @invetar_typs, kunden: 0)
    objekt.kunden = logged_kunde.id
    
    

    @antrags = Antrag.new
    @antrags.kunden = logged_kunde.id
    @antrags.name = "Antragformular von #{@invetar_typs.name}(#{objekt.invetarnummer})"
    @antrags.status = 1
    @antrags.typ = 2
    @antrags.bezug = objekt.id
    @antrags.save

    objekt.bezug = @antrags.id
    objekt.backat += Setting.find_by(name: "Ausleihdauer").value.to_i * 86400
    objekt.save
    
    redirect_to invetar_path(objekt.id)      
  end
  
  def zuruek
    @item = Invetar.find(params[:id])
    @item.kunden = 0
    @item.save

    redirect_to edit_antrag_path(@item.bezug)      
  end

  def pdf
    item = Invetar.find(params[:id])
    typ = InvetarTyp.find(item.typ)
    kunde = Student.find(item.kunden)
    # respond_to do |format|
    #   format.pdf do 
        #PDF generiren
        pdf = Invetarspdfs.new(item, kunde, typ)
        #pdf.text "MUSS NOCH GEMACHT WERDEN"
        send_data pdf.render, filename: "Ausleihformular-#{typ.name}NR:#{item.invetarnummer}.pdf"
    #   end
    # end    
  end
  
  

  # GET /invetars/1
  # GET /invetars/1.json
  def show
    @invetar_typs = InvetarTyp.all
    if set_invetar.kunden == 0
        @kunde = Student.new 
    else
        @kunde = Student.find(set_invetar.kunden)
    end
    
    if current_rule.invetar_Show
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /invetars/new
  def new
    @invetar_typs = InvetarTyp.all
    if current_rule.invetar_New
        @invetar = Invetar.new      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # GET /invetars/1/edit
  def edit
    @invetar_typs = InvetarTyp.all
    if current_rule.invetar_edit
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /invetars
  # POST /invetars.json
  def create
    @invetar = Invetar.new(invetar_params)
    @invetar.backat = ""
    @invetar.kunden = 0

    respond_to do |format|
      if @invetar.save
        format.html { redirect_to @invetar, notice: 'Invetar was successfully created.' }
        format.json { render :show, status: :created, location: @invetar }
      else
        format.html { render :new }
        format.json { render json: @invetar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invetars/1
  # PATCH/PUT /invetars/1.json
  def update
    respond_to do |format|
      if @invetar.update(invetar_params)
        format.html { redirect_to @invetar, notice: 'Invetar was successfully updated.' }
        format.json { render :show, status: :ok, location: @invetar }
      else
        format.html { render :edit }
        format.json { render json: @invetar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invetars/1
  # DELETE /invetars/1.json
  def destroy
    if current_rule.invetar_delete
        @invetar.destroy
        respond_to do |format|
      format.html { redirect_to invetars_url, notice: 'Invetar was successfully destroyed.' }
      format.json { head :no_content }
    end      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invetar
      @invetar = Invetar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invetar_params
      params.require(:invetar).permit(:invetarnummer, :typ, :kunden, :beschreibung, :backat, :ausleihbar, :pfand)
    end
end
