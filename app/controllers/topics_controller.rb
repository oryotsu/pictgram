class TopicsController < ApplicationController
  #before_action :login_check, only: [:new, :edit, :update, :destroy]
def index
  @topics = Topic.all.includes(:favorite_users)
end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  
  #def show
    #@topic = Topic.find_by(id: params[:id])
   # @user = @topic.user
   # # 変数@likes_countを定義
   # @likes_count = Like.where(topic_id: @topic.id).count
 # end
  
 # def login_check
   # def topics?
     # flash[:alert] = "ログインしてください"
     # redirect_to_root_path
    #end
 # end

  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end