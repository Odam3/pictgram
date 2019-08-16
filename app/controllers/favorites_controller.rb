class FavoritesController < ApplicationController
  # before_action :authenticate_user,{only:[:index]}
  
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
  # binding.pry
    favorite.topic_id = params[:topic_id]
    favorite.save
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
  # binding.pry
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if favorite.destroy
      redirect_to topics_path, danger: 'お気に入りを解除しました'
    else
      redirect_to topics_path, danger: 'お気に入りの削除に失敗しました'
    end
  end
end
