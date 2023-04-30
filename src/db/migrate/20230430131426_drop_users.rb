class DropUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users do |t|
      t.string :name
      t.string :email,  index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :type
      t.integer :role, null: false, default: 0

      t.timestamps                null: false
    end
  end
end
