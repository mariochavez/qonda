class Profile < ActiveRecord::Base
  def some_friends(limit = 5)
    followings.all(:order => 'RANDOM()', :limit => limit, :conditions => ['profiles.created_at < ?', Time.now.utc])
  end
end