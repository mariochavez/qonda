class UpgradeTogConversatio20100312203521 < ActiveRecord::Migration
  def self.up
    
      migrate_plugin "tog_conversatio", 5
    
  end

  def self.down
    
      migrate_plugin "tog_conversatio", 0
    
  end
end