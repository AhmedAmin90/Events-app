module ApplicationHelper
    def like_or_dislike_btn(post)
        like = Like.find_by(post_id: post.id, user_id: current_user.id)
        if like
          link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
        else
          link_to('Like!', post_likes_path(post_id: post.id), method: :post)
        end
      end

      def attend_delist_btn(event)
        attend = EventsUser.find_by(user_id: current_user.id , event_id: event.id)
        if attend
          link_to('UnAttend !', events_user_path(id: attend.id, event_id: event.id), method: :delete)
        else
          link_to('Attend!', events_users_path(event_id: event.id), method: :post)
        end
      end
end
