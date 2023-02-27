class SessionsController < ApplicationController
  skip_before_action :authenticate_client!, only: [:new, :create, :destroy]

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
    current_client.update(authenticated: false)
    session.delete(:client_id)
    redirect_to root_url, notice: "Logged out!"
  end
end
