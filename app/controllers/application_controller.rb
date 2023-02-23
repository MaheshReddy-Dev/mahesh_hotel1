class ApplicationController < ActionController::Base
    helper_method :current_client
    def current_client
      if session[:client_id]
        @current_client ||= Client.find(session[:client_id])
      else
      @current_client = nil
      end
    end
  
end
