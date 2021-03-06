class TopicsController < ApplicationController
  before_action :authenticate_user! ,{only:[:new]}
  
  def index
    @topics = Topic.all.includes(:favorite_users,:favorites).order(created_at: :desc)
  end
  
  def new
    @topic = Topic.new
  end

  def create
    # @topic = current_user.topics.new(topic_params)
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
