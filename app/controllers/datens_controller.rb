class DatensController < ApplicationController
  before_action :set_daten, only: [:show, :edit, :update, :destroy]

  

  # GET /datens
  # GET /datens.json
  def index
    @datens = Daten.all
    @Studiengang = Studiengang.all
    @Modul = Modul.all
    @prof = Professor.all
    @kaigorie = DateienKategorien.all
  end

  # GET /datens/1
  # GET /datens/1.json
  def show
    if current_rule.datein_Show
        
        
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /datens/new
  def new
    if current_rule.datein_New
        @daten = Daten.new
        @dateien_kategoriens = DateienKategorien.all
        @studiengangs = Studiengang.all
        @moduls = Modul.all
        @professors = Professor.all        
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # GET /datens/1/edit
  def edit
    if current_rule.datein_edit
        @dateien_kategoriens = DateienKategorien.all
        @studiengangs = Studiengang.all
        @moduls = Modul.all
     @professors = Professor.all      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # POST /datens
  # POST /datens.json
  def create
    @daten = Daten.new(daten_params)
    reader = PDF::Reader.new(@daten.dateipfad.path)
    @daten.seiten = reader.page_count()
    if @daten.kategorie == 1
        @daten.preis = @daten.seiten * Setting.find_by(name: "SeitenPreisSkript").value.to_f / 100.0
    else
        @daten.preis = @daten.seiten * Setting.find_by(name: "SeitenPreisDoc").value.to_f / 100.0
    end
        

    respond_to do |format|
      if @daten.save
        format.html { redirect_to @daten, notice: 'Daten was successfully created.' }
        format.json { render :show, status: :created, location: @daten }
      else
        format.html { render :new }
        format.json { render json: @daten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datens/1
  # PATCH/PUT /datens/1.json
  def update
    respond_to do |format|
      if @daten.update(daten_params)
        format.html { redirect_to @daten, notice: 'Daten was successfully updated.' }
        format.json { render :show, status: :ok, location: @daten }
      else
        format.html { render :edit }
        format.json { render json: @daten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datens/1
  # DELETE /datens/1.json
  def destroy
    if current_rule.datein_delete
        @daten.destroy
        respond_to do |format|
          format.html { redirect_to datens_url, notice: 'Daten was successfully destroyed.' }
          format.json { head :no_content }
        end   
    else
        redirect_to root_path alert: "Keine Recht"
    end
   
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daten
      @daten = Daten.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daten_params
      params.require(:daten).permit(:name, :dateipfad, :kategorie, :studiengang, :modul, :semester, :professor, :autor, :druckbar, :sichtbar, :sendbar, :hinzugefuegt, :preis)
    end
end
