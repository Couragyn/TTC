class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :name
      t.integer :token, unique: true

      t.timestamps
    end
  end
end
