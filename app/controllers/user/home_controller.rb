class User::HomeController < UserController
  def index
    @assemblies = Assembly.all
  end
  
  def search
    render :json => {"response" => "OK"}
  end
end
