class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @studenten_statuss = StudentenStatus.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    if true
        @studenten_statuss = StudentenStatus.all
        @kunde = logged_kunde
        @ordersGedrukt = Order.where(kunde: logged_kunde, status: "4")
        @orders = Order.where(kunde: logged_kunde)  
        @datensAll = Daten.all 
        @lager = Lager.all   
        @invetarTyp = InvetarTyp.all
        @antragStatuses = AntragStatus.all
        @antragTyps =  AntragTyp.all

        @antrag = Antrag.where(kunden: logged_kunde.id)
        @invetar = Invetar.where(kunden: logged_kunde.id)

    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # GET /students/new
  def new
    if true
        @bib = params[:bib]
        @student = Student.new(bibnummer: @bib)
        @studiengangs = Studiengang.all
        @studenten_statuss = StudentenStatus.all 
        
             
    else
        redirect_to root_path alert: "Keine Recht"
    end    
  end

  # GET /students/1/edit
  def edit
    if current_rule.softwarerechte
        @studiengangs = Studiengang.all
        @studenten_statuss = StudentenStatus.all      
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.kundenstatus = 1
    @student.percentage = 1
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    if current_rule.softwarerechte
        @student.destroy
        respond_to do |format|
        format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
        format.json { head :no_content } 
        end     
    else
        redirect_to root_path alert: "Keine Recht"
    end
    
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:bibnummer, :surname, :name, :tel, :email, :percentage, :studiengang, :kundenstatus, :ersteinschreibung)
    end
end
