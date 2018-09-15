class AntragsController < ApplicationController
  before_action :set_antrag, only: [:show, :edit, :update, :destroy]

  # GET /antrags
  # GET /antrags.json
  def index
    @antrags = Antrag.all
    @kunden = Student.all
    @typ = AntragTyp.all
    @status = AntragStatus.all
  end

  # GET /antrags/1
  # GET /antrags/1.json
  def show
    if current_rule.antrag_Show
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  
  end

  def hub
    @antrags = Antrag.all
    @typ = AntragTyp.all
    @status = AntragStatus.all
    @massage = params[:massage]
    
  end
  

  # GET /antrags/new
  def new
    if current_rule.antragtyp
        @antrag = Antrag.new      
    else
        redirect_to root_path alert: "Keine Recht"
    end
  
    
  end

  # GET /antrags/1/edit
  def edit
    if current_rule.antrag_edit
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  
  end

  # POST /antrags
  # POST /antrags.json
  def create
    @antrag = Antrag.new(antrag_params)

    respond_to do |format|
      if @antrag.save
        format.html { redirect_to @antrag, notice: 'Antrag was successfully created.' }
        format.json { render :show, status: :created, location: @antrag }
      else
        format.html { render :new }
        format.json { render json: @antrag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /antrags/1
  # PATCH/PUT /antrags/1.json
  def update
    respond_to do |format|
      if @antrag.update(antrag_params)
        @antrag.status = 2
        @antrag.save
        format.html { redirect_to @antrag, notice: 'Antrag was successfully updated.' }
        format.json { render :show, status: :ok, location: @antrag }
      else
        format.html { render :edit }
        format.json { render json: @antrag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antrags/1
  # DELETE /antrags/1.json
  def destroy
    if current_rule.antrag_delete
        @antrag.destroy
        respond_to do |format|
        format.html { redirect_to antrags_url, notice: 'Antrag was successfully destroyed.' }
        format.json { head :no_content }
    end      
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  def dreamSpark
    input = params[:text]
    mass = ""
    if input.count("@") == 1 && input.count(";") == 1
      @antrag = Antrag.new
      if logged_kunde
        bnummer = Student.find_by( logged_kunde.id)
        @antrag.kunden = bnummer  
      end    
      @antrag.beschreibung = input
      @antrag.status = 1
      @antrag.typ = 1    
      @antrag.save      
      else
        mass = "falscher QR code"     
    end
    redirect_to hub_antrag_path(massage: mas)
end
    
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antrag
      @antrag = Antrag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antrag_params
      params.require(:antrag).permit(:name, :typ, :kunden, :status, :beschreibung, :datei)
    end
end
