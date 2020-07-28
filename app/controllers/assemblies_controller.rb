class AssembliesController < ApplicationController
  layout 'user'
  
  before_action :set_assembly, only: [:show]

  def index
    @assemblies = Assembly.all
  end

  def show
    @total_users_paid = User.where(paid: true).length
    @max_votes = User.where(paid: true).count
  end

  def do_a_vote
    Vote.create!(user_id: current_user.id, option_id: params[:option_id])
    @topic_render = Option.find(params[:option_id]).topic
    @votes_count = @topic_render.options.map { |option| option.votes.count }.sum
  end

  def history_votes
    @max_votes = User.where(paid: true).count
    @topic = Topic.find(params[:topic_id])
    @votes = Vote.includes(:user, :option).where(option_id: [@topic.options.pluck(:id)])
  end

  private

  def set_assembly
    @assembly = Assembly.find(params[:id])
  end
end
