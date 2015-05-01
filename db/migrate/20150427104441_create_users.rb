class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :phone
      t.text :address
      t.integer :role
      t.string :name

      t.timestamps null: false
    end
  end
end
