class EventAttendingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_attending = EventAttending.new
    @event_attending.attendee = current_user
    @event_attending.attended_event = @event
    if @event_attending.save
      flash[:success] = "Registration successful."
      redirect_to @event
    else
      flash.now[:error] = "Error: You have already registered for this event."
      render "events/show", status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:event_id])

    @event_attending = EventAttending.find_by(attendee_id: current_user, attended_event_id: event)
    @event_attending.delete

    redirect_to root_path
  end
end
