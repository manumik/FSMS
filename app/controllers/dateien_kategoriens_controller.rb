class DateienKategoriensController < ApplicationController
  before_action :set_dateien_kategorien, only: [:show, :edit, :update, :destroy]

  # GET /dateien_kategoriens
  # GET /dateien_kategoriens.json
  def index
    @dateien_kategoriens = DateienKategorien.all
  end

  # GET /dateien_kategoriens/1
  # GET /dateien_kategoriens/1.json
  def show
    if current_rule.dateienKatigorie
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /dateien_kategoriens/new
  def new
    if current_rule.dateienKatigorie
        @dateien_kategorien = DateienKategorien.new  
    else
        redirect_to root_path alert: "Keine Recht"
    end
   
  end

  # GET /dateien_kategoriens/1/edit
  def edit
    if current_rule.dateienKatigorie
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # POST /dateien_kategoriens
  # POST /dateien_kategoriens.json
  def create
    @dateien_kategorien = DateienKategorien.new(dateien_kategorien_params)

    respond_to do |format|
      if @dateien_kategorien.save
        format.html { redirect_to @dateien_kategorien, notice: 'Dateien kategorien was successfully created.' }
        format.json { render :show, status: :created, location: @dateien_kategorien }
      else
        format.html { render :new }
        format.json { render json: @dateien_kategorien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dateien_kategoriens/1
  # PATCH/PUT /dateien_kategoriens/1.json
  def update
    respond_to do |format|
      if @dateien_kategorien.update(dateien_kategorien_params)
        format.html { redirect_to @dateien_kategorien, notice: 'Dateien kategorien was successfully updated.' }
        format.json { render :show, status: :ok, location: @dateien_kategorien }
      else
        format.html { render :edit }
        format.json { render json: @dateien_kategorien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dateien_kategoriens/1
  # DELETE /dateien_kategoriens/1.json
  def destroy
    if current_rule.dateienKatigorie
        @dateien_kategorien.destroy
        respond_to do |format|
          format.html { redirect_to dateien_kategoriens_url, notice: 'Dateien kategorien was successfully destroyed.' }
          format.json { head :no_content }
        end   
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dateien_kategorien
      @dateien_kategorien = DateienKategorien.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dateien_kategorien_params
      params.require(:dateien_kategorien).permit(:name)
    end
end
