class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by_bib(params[:bib]) || Member.find_by_spitzname(params[:spitzname])
    if member && member.authenticate(params[:password])
        session[:member_id] = member.id
        redirect_to root_url, notice: "logged in!"
    else
        flash.now.alert = "Falsches Password"
        render "new"
    end
  end

  def destroy
        session[:member_id] = nil
      
        redirect_to root_url, notice: "logged out!"
      
  end
  
  
end
