class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end
  
  def new
    @events = Event.where(creator_id: current_user)
    @users = User.all.excluding(current_user)
  end
  
  def create
  end
  
end
