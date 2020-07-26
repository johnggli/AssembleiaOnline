class AssembliesController < ApplicationController
  layout 'user'

  def index
    @assemblies = Assembly.all
  end

  def show
    @assembly = Assembly.find(params[:id])
    @block = false
    @total_users_paid = User.where("paid = true").length
    @total_topic_votes = 0
  end

  def do_a_vote
    Vote.create!(user_id: current_user.id, option_id: params[:id])
    
    @assembly = Option.find(params[:id]).topic.assembly
    redirect_to assembly_path(@assembly)


    # @assembly.state == "open" ? @assembly.state = :close : @assembly.state = :open
    # if @assembly.save
    #   render json: { success: true, state: @assembly.state }
    # else
    #   render json: { success: false }
    # end
  end
end
