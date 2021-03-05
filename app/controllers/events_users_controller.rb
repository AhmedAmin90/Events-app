class EventsUsersController < ApplicationController
    def create 
        @event = Event.find(params[:event_id])
        @attend = EventsUser.create(user_id: current_user.id , event_id: @event.id)
        if @attend.save
                redirect_to event_path(@event) , notice: 'You attended to this event.'
            else
                redirect_to event_path(@event) , alert: 'You can not attend to this event.'
            end
    end

    def destroy 
        @event = Event.find(params[:event_id])
        attend = EventsUser.find_by(id: params[:id], user_id: current_user.id , event_id: @event.id)
        if attend
            attend.destroy
            redirect_to event_path(@event) , notice: 'You delist your name from attendance.'
        else
            redirect_to event_path(@event) , alert: 'Some thing is error'
        end
    end
end
