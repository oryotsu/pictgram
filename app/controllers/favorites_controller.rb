class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    favorite = current_user.favorites.find_by(topic_id: params[:topic_id])
    if favorite.destroy
      redirect_to topics_path, success: 'お気に入りを取り消しました'
    else
      flash[:notice] = "お気に入りの取り消しに失敗しました"
    end
  end
  
  
  
 def show
    @topic = Topic.find_by(id: params[:id])
    # 変数@likes_countを定義
     @user = @topic.user 
    @likes_count = Like.where(topic_id: @topic.id).count
 end
  
end
