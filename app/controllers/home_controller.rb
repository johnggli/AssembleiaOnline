class HomeController < ApplicationController
  layout 'user'
  
  def index
    @assemblies = Assembly.all
    
  end
  
  def search
    
  end
end
