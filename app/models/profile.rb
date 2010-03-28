class Profile < ActiveRecord::Base
  def some_friends(limit = 5)
    followers.all(:order => 'RANDOM()', :limit => limit, :conditions => ['profiles.created_at < ?', Time.now.utc])
  end
  
  def total_friends
    followers.count()
  end
  
  def total_followers
    followings.count()
  end
end