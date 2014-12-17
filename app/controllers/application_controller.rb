class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :detect_device_format
  
  helper_method :resource, :resource_name, :devise_mapping
  
  def after_sign_in_path_for(resource)
    posts_path
  end



  private

    def detect_device_format
      case request.user_agent
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Windows Phone/i
        request.variant = :phone
      end
    end
end
