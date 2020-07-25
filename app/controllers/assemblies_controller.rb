class AssembliesController < ApplicationController
  layout 'user'

  def index
    @assemblies = Assembly.all
  end

  def show
    @assembly = Assembly.find(params[:id])
  end
end
