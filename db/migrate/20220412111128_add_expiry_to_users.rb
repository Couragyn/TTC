class AddExpiryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :expiry, :date
  end
end
