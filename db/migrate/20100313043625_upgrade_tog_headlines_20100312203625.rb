class UpgradeTogHeadlines20100312203625 < ActiveRecord::Migration
  def self.up
    
      migrate_plugin "tog_headlines", 3
    
  end

  def self.down
    
      migrate_plugin "tog_headlines", 0
    
  end
end