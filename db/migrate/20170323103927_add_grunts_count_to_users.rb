class AddGruntsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :grunts_count, :integer, :default => 0
  end
end
