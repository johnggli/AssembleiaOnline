class AssembliesController < ApplicationController
  layout 'user'
  
  before_action :set_assembly, only: [:show]

  def index
    @assemblies = Assembly.all
  end

  def show
    @total_users_paid = User.where(paid: true).length
  end

  def do_a_vote
    Vote.create!(user_id: current_user.id, option_id: params[:id])
    
    @assembly = Option.find(params[:id]).topic.assembly
    redirect_to assembly_path(@assembly)
  end

  private

  def set_assembly
    @assembly = Assembly.find(params[:id])
  end
end
