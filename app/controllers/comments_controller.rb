class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.post_id = @post.id

    if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
        redirect_to  post_path(@post), alert: @comment.errors.full_messages.join('. ').to_s
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
