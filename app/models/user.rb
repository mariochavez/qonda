class User < ActiveRecord::Base
  def some_groups(limit = 5)
    groups.all(:order => 'RANDOM()', :limit => limit, :conditions => ['groups.created_at < ?', Time.now.utc])
  end
  
  def unreaded_messages
    received_messages.all(:conditions => ["is_read = ?", false])
  end
  
  def total_invitations
    received_messages.count(:conditions => ["is_read = ? AND subject like ?", false, '%siguiendo%!'])
  end
  
  def total_new_messages
    received_messages.count(:conditions => ["is_read = ? AND not subject like ?", false, '%siguiendo%!'])
  end
end