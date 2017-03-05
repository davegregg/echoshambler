class AddCreepeesCountCreepersCountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :creepees_count, :integer, :default => 0
    add_column :users, :creepers_count, :integer, :default => 0
  end
end
