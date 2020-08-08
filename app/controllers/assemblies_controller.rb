class AssembliesController < ApplicationController
  layout 'user'
  
  before_action :set_assembly, only: [:show]
  before_action :set_max_votes, only: [:show, :history_votes]
  before_action :authenticate_user!, notice: I18n.t('login_info')

  def index
    @assemblies = Assembly.all
  end

  def show
  end

  def set_vote
    Vote.create!(user_id: current_user.id, option_id: params[:option_id])
    @topic_render = Option.find(params[:option_id]).topic
    @votes_count = @topic_render.sum_votes
  end

  def history_votes
    @topic = Topic.find(params[:topic_id])
    @votes = Vote.includes(:user, :option).where(option_id: [@topic.options.pluck(:id)])
  end

  private

  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  def set_max_votes
    @max_votes = User.where(paid: true).count
  end
end
