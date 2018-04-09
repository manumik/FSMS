class StudiengangsController < ApplicationController
  before_action :set_studiengang, only: [:show, :edit, :update, :destroy]

  # GET /studiengangs
  # GET /studiengangs.json
  def index
    @studiengangs = Studiengang.all
  end

  # GET /studiengangs/1
  # GET /studiengangs/1.json
  def show
  end

  # GET /studiengangs/new
  def new
    @studiengang = Studiengang.new
  end

  # GET /studiengangs/1/edit
  def edit
  end

  # POST /studiengangs
  # POST /studiengangs.json
  def create
    @studiengang = Studiengang.new(studiengang_params)

    respond_to do |format|
      if @studiengang.save
        format.html { redirect_to @studiengang, notice: 'Studiengang was successfully created.' }
        format.json { render :show, status: :created, location: @studiengang }
      else
        format.html { render :new }
        format.json { render json: @studiengang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studiengangs/1
  # PATCH/PUT /studiengangs/1.json
  def update
    respond_to do |format|
      if @studiengang.update(studiengang_params)
        format.html { redirect_to @studiengang, notice: 'Studiengang was successfully updated.' }
        format.json { render :show, status: :ok, location: @studiengang }
      else
        format.html { render :edit }
        format.json { render json: @studiengang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studiengangs/1
  # DELETE /studiengangs/1.json
  def destroy
    @studiengang.destroy
    respond_to do |format|
      format.html { redirect_to studiengangs_url, notice: 'Studiengang was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studiengang
      @studiengang = Studiengang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def studiengang_params
      params.require(:studiengang).permit(:name)
    end
end
