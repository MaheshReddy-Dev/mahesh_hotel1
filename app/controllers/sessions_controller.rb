class SessionsController < ApplicationController
  def new
  end

  def create
    client = Client.find_by_emaail(params[:emaail])
    if client && client.authenticate(params[:password])
      session[:client_id] = client.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      puts flash
      debugger # Add this line to pause execution and start the debugger
      render "new"
    end
  end
  
  

   def destroy
     session[:client_id] = nil
     redirect_to root_url, notice: "Logged out!"
   end
   
   def current_client
    if session[:client_id]
      begin
        @current_client ||= Client.find(session[:client_id])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to root_path, alert: "Client not found"
      end
    else
      @current_client = nil
    end
  end
  
end
