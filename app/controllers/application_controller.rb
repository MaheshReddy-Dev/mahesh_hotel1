class ApplicationController < ActionController::Base
  helper_method :current_client

  private
  
  def current_client
    return unless session[:client_id]
    @current_client ||= Client.find_by(id: session[:client_id])
  end

  def authenticate_client!
      if current_client.nil? || !current_client.authenticated?
        redirect_to login_path, alert: 'Please log in to continue.'
      end
    end
end


