class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller? 
 
    protected 
 
   #Para permitir a atualização de um atributo "current_locale" que adicionei ao model
   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :pre_registration_id]) 
   end
end
