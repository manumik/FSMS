class AntragTypsController < ApplicationController
  before_action :set_antrag_typ, only: [:show, :edit, :update, :destroy]

  # GET /antrag_typs
  # GET /antrag_typs.json
  def index
    @antrag_typs = AntragTyp.all
  end

  # GET /antrag_typs/1
  # GET /antrag_typs/1.json
  def show
    if current_rule.antragtyp
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /antrag_typs/new
  def new
    if current_rule.antragtyp
        @antrag_typ = AntragTyp.new     
    else
        redirect_to root_path alert: "Keine Recht"
    end
   
  end

  # GET /antrag_typs/1/edit
  def edit
    if current_rule.antragtyp
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /antrag_typs
  # POST /antrag_typs.json
  def create
    @antrag_typ = AntragTyp.new(antrag_typ_params)

    respond_to do |format|
      if @antrag_typ.save
        format.html { redirect_to @antrag_typ, notice: 'Antrag typ was successfully created.' }
        format.json { render :show, status: :created, location: @antrag_typ }
      else
        format.html { render :new }
        format.json { render json: @antrag_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /antrag_typs/1
  # PATCH/PUT /antrag_typs/1.json
  def update
    respond_to do |format|
      if @antrag_typ.update(antrag_typ_params)
        format.html { redirect_to @antrag_typ, notice: 'Antrag typ was successfully updated.' }
        format.json { render :show, status: :ok, location: @antrag_typ }
      else
        format.html { render :edit }
        format.json { render json: @antrag_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antrag_typs/1
  # DELETE /antrag_typs/1.json
  def destroy
    if current_rule.antragtyp
        @antrag_typ.destroy
        respond_to do |format|
        format.html { redirect_to antrag_typs_url, notice: 'Antrag typ was successfully destroyed.' }
        format.json { head :no_content }
    end      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antrag_typ
      @antrag_typ = AntragTyp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antrag_typ_params
      params.require(:antrag_typ).permit(:name, :beschreibung)
    end
end
