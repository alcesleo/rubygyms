class AddDefaultValueToOwner < ActiveRecord::Migration
  def change
    change_column :users, :owner, :boolean, :default => false
  end
end
