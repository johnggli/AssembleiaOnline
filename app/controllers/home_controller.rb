class HomeController < ApplicationController
  layout 'user'
  
  def index
    @assemblies = Assembly.all
    
  end
  
  def search
    search_pre_registration = PreRegistration.where(cpf: params[:cpf].to_s)
    
    if search_pre_registration.present?
      render json: {id: search_pre_registration[0].id, cpf: search_pre_registration[0].cpf, 
                    bloc: search_pre_registration[0].bloc, ap: search_pre_registration[0].ap,
                    error: false }
    else
      render json: {error: true}
    end
  end
end
