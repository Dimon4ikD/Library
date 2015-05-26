class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :phone
      t.text :address
      t.integer :role
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
