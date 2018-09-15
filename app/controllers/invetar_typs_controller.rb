class InvetarTypsController < ApplicationController
  before_action :set_invetar_typ, only: [:show, :edit, :update, :destroy]

  # GET /invetar_typs
  # GET /invetar_typs.json
  def index
    @invetar_typs = InvetarTyp.all
  end

  # GET /invetar_typs/1
  # GET /invetar_typs/1.json
  def show
  end

  # GET /invetar_typs/new
  def new
    @invetar_typ = InvetarTyp.new
  end

  # GET /invetar_typs/1/edit
  def edit
  end

  # POST /invetar_typs
  # POST /invetar_typs.json
  def create
    @invetar_typ = InvetarTyp.new(invetar_typ_params)

    respond_to do |format|
      if @invetar_typ.save
        format.html { redirect_to new_invetar_path, notice: 'Invetar typ was successfully created.' }
        format.json { render :show, status: :created, location: @invetar_typ }
      else
        format.html { render :new }
        format.json { render json: @invetar_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invetar_typs/1
  # PATCH/PUT /invetar_typs/1.json
  def update
    respond_to do |format|
      if @invetar_typ.update(invetar_typ_params)
        format.html { redirect_to new_invetar_path, notice: 'Invetar typ was successfully updated.' }
        format.json { render :show, status: :ok, location: @invetar_typ }
      else
        format.html { render :edit }
        format.json { render json: @invetar_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invetar_typs/1
  # DELETE /invetar_typs/1.json
  def destroy
    @invetar_typ.destroy
    respond_to do |format|
      format.html { redirect_to new_invetar_path, notice: 'Invetar typ was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invetar_typ
      @invetar_typ = InvetarTyp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invetar_typ_params
      params.require(:invetar_typ).permit(:name, :icon)
    end
end
