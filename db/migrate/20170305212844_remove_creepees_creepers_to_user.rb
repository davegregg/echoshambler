class RemoveCreepeesCreepersToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :creepees_count, :string
    remove_column :users, :creepers_count, :string
  end
end
