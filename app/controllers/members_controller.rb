class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @softwarerechte = Softwarerechte.all
    @Studiengang = Studiengang.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    if current_rule.invetar_Show
              
    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  # GET /members/new
  def new
    if current_rule.member_Show
        @member = Member.new
        @softwarerechte = Softwarerechte.all
        @Studiengang = Studiengang.all     
    else
        redirect_to root_path alert: "Keine Recht"
    end
   
  end

  # GET /members/1/edit
  def edit
    if current_rule.member_edit
        @softwarerechte = Softwarerechte.all
        @Studiengang = Studiengang.all      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    if current_rule.member_delete
        @member.destroy
        respond_to do |format|
          format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
          format.json { head :no_content }     
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:bib, :password, :password_confirmation, :spitzname, :name, :surename, :email, :tel, :studengang, :softwarerechte, :chipid, :getraenke)
    end
end
