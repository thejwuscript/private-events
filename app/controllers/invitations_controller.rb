class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end
  
  def new
    @events = Event.where(creator_id: current_user)
    @users = User.all.excluding(current_user)
  end
  
  def create
    @invitee = User.find_by(name: invitation_params[:invitee])
    @event = Event.find_by(name: invitation_params[:event])
    @invitation = Invitation.new
    @invitation.invitee = @invitee
    @invitation.event = @event

    if @invitation.save
      flash[:success] = "Invitation sent."
      redirect_to root_path
    else
      flash.now[:error] = "Uh oh. Something went wrong."
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def invitation_params
    params.require(:invitation).permit(:invitee, :event)
  end
  
end