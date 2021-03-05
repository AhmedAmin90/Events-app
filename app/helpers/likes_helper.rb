module LikesHelper
    def like_or_dislike_btn(post)
        like = Like.find_by(post_id: post.id, user_id: current_user.id)
        if like
          link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
        else
          link_to('Like!', post_likes_path(post_id: post.id), method: :post)
        end
      end
end
