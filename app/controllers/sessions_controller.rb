class SessionsController < ApplicationController

  def new
  end

  def create
    client = Client.find_by(emaail: params[:emaail])
    if client && client.authenticate(params[:password])
      session[:client_id] = client.id 
      client.update(authenticated: true) 
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end  

def destroy
  if current_client
    current_client.update(authenticated: false)
    session[:client_id] = nil
    @current_client = nil
    redirect_to root_url, notice: "Logged out!"
  else
    redirect_to login_path, alert: 'Please log in to continue.'
  end
end

  
end
