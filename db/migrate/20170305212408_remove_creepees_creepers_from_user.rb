class RemoveCreepeesCreepersFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :creepees, :string
    remove_column :users, :creepers, :string
  end
end
