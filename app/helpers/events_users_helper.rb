module EventsUsersHelper
    def attend_delist_btn(event)
        attend = EventsUser.find_by(user_id: current_user.id , event_id: event.id)
        if attend
          link_to('UnAttend !', events_user_path(id: attend.id, event_id: event.id), method: :delete)
        else
          link_to('Attend!', events_users_path(event_id: event.id), method: :post)
        end
      end
end
