class User::HomeController < UserController
  def index
    @assemblies = Assembly.all
  end
end
