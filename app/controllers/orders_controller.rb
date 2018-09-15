class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @Datei = Daten.all
    @kunden = Student.all
    @orderStatus = OrderStatus.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if current_rule.order_Show
        @orderStatus = OrderStatus.all
        @Datei = Daten.all
        @kunden = Student.all
        
    else
        redirect_to root_path alert: "Keine Recht"
    end

  end

  # GET /orders/new
  def new
    if current_rule.order_New
        @order = Order.new
    else
        redirect_to root_path alert: "Keine Recht"
    end

  end

  # GET /orders/1/edit
  def edit
    if current_rule.order_edit

    else
        redirect_to root_path alert: "Keine Recht"
    end
  end

  def extPrint
    @seiten = params[:seiten].to_i
    @intern = params[:int].to_i
    if @seiten > 0
      if @intern == 0
        order = Order.new
        order.seiten = @seiten
        order.status = 7
        order.preis = @seiten * Setting.find_by(name: "SeitenPreisDoc").value.to_f / 100.0
        order.save
      else
        order = Order.new
        order.seiten = @seiten
        order.status = 7
        order.preis = 0.0
        order.save
      end
    end
    
    redirect_to print_order_path(preis: order.preis)
    
  end

  def print
    @qOrer = Order.new
    @order = Order.where(status: "2")
    @orderSort = Order.where(status: "3")
    @datens = Daten.where(druckbar: true)
    @lager = Lager.all

    @preis = params[:preis].to_f
    
  end

  def qOrder
    if (params[:order].present?)
    @datei  = Daten.find(params[:order][:datei])
    @kunde  = Student.find_by(bibnummer: params[:order][:kunde])
    if (@datei)
      if (@kunde)
        # nIx achen
      else
        @kunde = Student.new 
        @kunde.bibnummer = params[:order][:kunde]
        @kunde.kundenstatus = 2
        @kunde.percentage = 1
        @kunde.save
      end
      #Order erzeugen
      @qOrer = Order.new
      @qOrer.status = 6
      @qOrer.datei = @datei.id
      @qOrer.kunde = @kunde.id
      @qOrer.seiten = @datei.seiten
      @qOrer.preis = @datei.preis
      @qOrer.save

      @qOrer = Order.new
      @qOrer.datei = @datei.id
    else
      redirect_to print_order_path(0)
    end

  end
    @datens = Daten.where(druckbar: true)
    @order = Order.where(status: "6")
    @kundenAll = Student.all
    
    # @qOrder.datei = @datei
  end

  def massOrder
    @order = Order.where(status: "6")
    @order.each do |o|
      o.status = 2
      o.save
    end
    redirect_to print_order_path(0)
  end
  
  

  def doPrint
        datei =  Daten.find(params[:id])
        @orders = Order.where(datei: params[:id], status: "2")
        send_file(
          "#{Rails.root}/public#{datei.dateipfad.url}",
          :disposition => 'inline',
          type: "application/pdf"
        )
        
        @orders.each do |o|
          #einsotiren
          #Datei oder kunde 
          kat = Daten.find(o.datei).kategorie
          if kat == 1
            #Platz finden
            @lager = Lager.find_by(inhalt: o.datei, dateiORkunde: true)
            if @lager
              @lager.docAnzahl += 1
              @lager.save
              o.lager = @lager.id
            else
              @lager = Lager.find_by(inhalt: 0, dateiORkunde: true)
              @lager.inhalt = o.datei
              @lager.docAnzahl += 1
              @lager.save
              o.lager = @lager.id
            end
          else
          #Platz finden für user 
            #Platz finden
            @lager = Lager.find_by(inhalt: o.datei, dateiORkunde: false)
            if @lager
              @lager.docAnzahl += 1
              @lager.save
              o.lager = @lager.id
            else
              @lager = Lager.find_by(inhalt: 0, dateiORkunde: false)
              @lager.inhalt = o.datei
              @lager.docAnzahl += 1
              @lager.save
              o.lager = @lager.id
            end
          end
          #Status erhöhern
            o.status = 3
            o.save
        end
      redirect_to print_order_path(0)
  end

  def doSort
      @orders = Order.where(lager: params[:id], status: "3")
      @orders.each do |o|
        o.status = 4
        o.save
    end
    redirect_to print_order_path(0)
  end



  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    if current_rule.order_delete
        @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
      end
    else
        redirect_to root_path alert: "Keine Recht"
    end



  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:orderid, :kunde, :datei, :status)
    end
end
