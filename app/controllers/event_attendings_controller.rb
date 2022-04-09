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
end
