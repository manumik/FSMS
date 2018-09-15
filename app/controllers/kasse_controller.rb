class KasseController < ApplicationController



    def index
        @bla = params[:bib]
        @kunde = Student.new
    end

    def kasse
        @datensAll = Daten.all
        @OrderStatuse = OrderStatus.all
        @StudentenStatuse = StudentenStatus.all
        @Studiengang = Studiengang.all
        @dateien_kategoriens = DateienKategorien.all
        @Modul = Modul.all
        @prof = Professor.all
        @lager = Lager.all

        @daten = Daten.new
        
        

        if Student.find_by( bibnummer: params[:bib]) || Student.find_by( bibnummer: session[:bib])
            if params[:bib]
                session[:bib] = params[:bib]
            end
            @kunde = logged_kunde
            bnummer = @kunde.bibnummer
        else
            if current_member
                @kunde = Student.new
                @kunde.bibnummer = session[:bib]
                @kunde.percentage = 1
                @kunde.kundenstatus = 2
                @kunde.save
            else
                redirect_to new_student_path(bib: bnummer)
            end
        end
        @datens = Daten.where(sichtbar: true)

        @ordersBestellen = Order.where(kunde: logged_kunde, status: "1")
        @orders = Order.where(kunde: logged_kunde)

        @ordersBestellen.each do |o|
            if Daten.exists?(o.datei)
                zahl = Daten.find(o.datei).preis
            else
                zahl = 0.0
            end

            if is_number?( zahl )
                @preis ||= 0
                @preis += zahl.to_f
            end
        end

    end

    def next_kunde
    end

    def uplode
        #Neue Datei erzeugen
        @daten = Daten.new
        @daten.name = params[:daten][:name] 
        @daten.dateipfad =  params[:daten][:dateipfad]
        @daten.kategorie = params[:daten][:kategorie]
        @daten.studiengang = params[:daten][:studiengang]
        @daten.modul = params[:daten][:modul] 
        @daten.semester = params[:daten][:semester]
        @daten.professor = params[:daten][:professor]
        @daten.druckbar = false
        @daten.sichtbar = params[:daten][:sichtbar]
        @daten.sendbar = false
        @daten.hinzugefuegt = DateTime.now       
        reader = PDF::Reader.new(@daten.dateipfad.path)
        @daten.seiten = reader.page_count()
        if @daten.kategorie == 1
            @daten.preis = @daten.seiten * Setting.find_by(name: "SeitenPreisSkript").value.to_f / 100.0
        else
            @daten.preis = @daten.seiten * Setting.find_by(name: "SeitenPreisDoc").value.to_f / 100.0
        end
        @daten.besitzer = logged_kunde
        @daten.save

        #Neue Oerder Erzeugen
        @order = Order.new
        @order.kunde = logged_kunde.id
        @order.datei  = @daten.id
        @order.status = 1
        @order.seiten = @daten.seiten
        @order.save 
        redirect_to kasse_kasse_path(bib: logged_kunde.bibnummer)
    end
    

    def bestellen
        @datei = Daten.find(params[:id])
        order = Order.new(kunde: logged_kunde.id ,datei:  @datei.id, status: "1",seiten: @datei.seiten,preis: @datei.preis)
        order.save
        redirect_to kasse_kasse_path(bib: logged_kunde.bibnummer)
    end

    def order
        bnummer = Student.find(logged_kunde.id)
        @Orderschange = Order.where(kunde: logged_kunde.id, status: "1" )
        @Orderschange.each do |o|
            o.status = "2"
            o.save
        end
        redirect_to kasse_kasse_path(bib:logged_kunde.bibnummer)
    end

    def orderDelete
        @o = Order.find(params[:id])
        @o.destroy
        redirect_to kasse_kasse_path(bib: logged_kunde.bibnummer)
    end

    def ausgegeben
        bnummer = Student.find(logged_kunde.id)
        @Orderschange = Order.find(params[:id])
#Ausotiren
        @lager = Lager.find(@Orderschange.lager)
        @lager.docAnzahl -= 1
        if  @lager.docAnzahl <= 0
            @lager.inhalt = 0
            @lager.docAnzahl = 0
        end
        @lager.save

        @Orderschange.status = 5
        @Orderschange.lager = ""
        @Orderschange.save

        redirect_to kasse_kasse_path(bib: logged_kunde.bibnummer)
    end

    

    def logoutKunde
        session[:bib] = nil

        redirect_to root_url, notice: "logged out!"
    end




    def is_number? string
        true if Float(string) rescue false
      end


end
