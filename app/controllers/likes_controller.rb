class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = Like.create(user_id: current_user.id ,post_id: @post.id)

        if @like.save
            redirect_to post_path(@post) , notice: 'You liked a post.'
        else
            redirect_to post_path(@post), alert: 'You cannot like this post.'
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        like = Like.find_by(id: params[:id], user: current_user, post_id: @post.id)
        if like
            like.destroy
            redirect_to post_path(@post), notice: 'You disliked a post.'
          else
            redirect_to post_path(@post), alert: 'You cannot dislike post that you did not like before.'
          end
    end
end
