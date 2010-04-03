# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def new_messages
    current_user.total_new_messages
  end
  
  def invitations
    current_user.total_invitations
  end
end
