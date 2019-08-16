class CommentsController < ApplicationController
  # before_action :authenticate_user,{only:[:new]}
  
  def index
    @comments = current_user.comments_topics
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
     
    # @comment = current_user.comments.new(comment_params)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:topic_id)
  end
end
