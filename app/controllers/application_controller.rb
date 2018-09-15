class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
        
  end

private

    def current_member
        @current_member ||= Member.find(session[:member_id])  if session[:member_id]
    end

    def current_rule
      if !current_member.blank?
        @current_rule = Softwarerechte.find(current_member.softwarerechte)
      else
        @current_rule = Softwarerechte.find(2)
      end
    end

    def logged_kunde
        @kunde = Student.find_by( bibnummer: session[:bib])
    end
    

    def orderStatuse
        @OrderStatuse = OrderStatus.all
    end

    def setting(name)
        @Setting = Setting.find_by(name: name).value
    end

    def studentenStatuse
        @StudentenStatuse = StudentenStatus.all 
    end

    def studiengang
        @Studiengang = Studiengang.all
    end

    def modul
        @Modul = Modul.all
    end

    def prof
        @prof = Professor.all 
    end

    helper_method :current_member
    helper_method :current_rule
    helper_method :logged_kunde
    helper_method :setting

    helper_method :orderStatuse
    helper_method :studentenStatuse
    helper_method :studiengang
    helper_method :modul
    helper_method :prof

end
