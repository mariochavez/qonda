class UpgradeTogVault20100312203822 < ActiveRecord::Migration
  def self.up
    
      migrate_plugin "tog_vault", 3
    
  end

  def self.down
    
      migrate_plugin "tog_vault", 0
    
  end
end