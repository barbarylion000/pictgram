class FavoritesController < ApplicationController
   def index
   @favorites_topics = current_user.favorites_topics
   end
   
   def show
      @post = Post.find_by(id:params[:id])
      @user = @post.user
      @likes_count = Like.where(post_id:@post_id).count
   end
   
   def create
      favorite = Favorite.new
      favorite.user_id = current_user_id
      favorite.topic_id = params[:topic_id]

      if favorite.save
         redirect_to topics_path, success: 'お気に入りに登録しました'
      else
         redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
      end
   end
end
