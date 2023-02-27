class ApplicationController < ActionController::Base
  before_action :authenticate_client!
  helper_method :current_client

  private
  
  def current_client
    return unless session[:client_id]
    @current_client ||= Client.find_by(id: session[:client_id])
  end

  def authenticate_client!
    unless is_active_admin?
      if current_client.nil? || !current_client.authenticated?
        redirect_to login_path, alert: 'Please log in to continue.'
      end
    end
  end

  def is_active_admin?
    request.path.include?('admin')
  end
end
