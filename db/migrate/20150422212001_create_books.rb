class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.integer :amount
      t.date :year
      t.string :author, null: false
      t.integer :pages_amount
      t.string :isbn
      t.string :udc
      t.string :lbc
      t.string :price, precision: 15, scale: 2


      t.timestamps null: false
    end
    add_foreign_key :books
  end
end
