class Profile < ActiveRecord::Base
  def some_friends(limit = 5)
    random = ''
    random = RANDOM_CODE if defined? RANDOM_CODE
        
    followers.all(:order => random, :limit => limit, :conditions => ['profiles.created_at < ?', Time.now.utc])
  end
  
  def total_friends
    followers.count()
  end
  
  def total_followers
    followings.count()
  end
end