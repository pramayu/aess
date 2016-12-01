class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :god_like, :boolean
  end
end
