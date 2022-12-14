class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone_number])
  end
  
end
