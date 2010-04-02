class User < ActiveRecord::Base
  def some_groups(limit = 5)
    groups.all(:order => 'RANDOM()', :limit => limit, :conditions => ['groups.created_at < ?', Time.now.utc])
  end
  
  def unreaded_messages
    received_messages.all(:conditions => ["is_read = ?", false])
  end
end