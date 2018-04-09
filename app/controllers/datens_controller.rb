class DatensController < ApplicationController
  before_action :set_daten, only: [:show, :edit, :update, :destroy]

  # GET /datens
  # GET /datens.json
  def index
    @datens = Daten.all
  end

  # GET /datens/1
  # GET /datens/1.json
  def show
  end

  # GET /datens/new
  def new
    @daten = Daten.new
    @dateien_kategoriens = DateienKategorien.all
    @studiengangs = Studiengang.all
    @moduls = Modul.all
    @professors = Professor.all
  end

  # GET /datens/1/edit
  def edit
    @dateien_kategoriens = DateienKategorien.all
    @studiengangs = Studiengang.all
    @moduls = Modul.all
    @professors = Professor.all
  end

  # POST /datens
  # POST /datens.json
  def create
    @daten = Daten.new(daten_params)

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
    @daten.destroy
    respond_to do |format|
      format.html { redirect_to datens_url, notice: 'Daten was successfully destroyed.' }
      format.json { head :no_content }
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
