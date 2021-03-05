module FriendshipsHelper
    def add_friend(event)
        friend = Friendship.find_by(user_id: current_user.id , friend_id: event.id)
        if friend
          link_to('Unfriend', friendship_path(id: attend.id, event_id: event.id), method: :delete)
        else
          link_to('Add friend', friendships_path(event_id: event.id), method: :post)
        end
      end
end
