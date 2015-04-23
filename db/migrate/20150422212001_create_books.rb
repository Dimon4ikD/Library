class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :amount
      t.date :year
      t.string :author
      t.integer :pages_amount
      t.string :isbn
      t.string :udc
      t.string :lbc
      t.references :shelf, index: true

      t.timestamps null: false
    end
    add_foreign_key :books, :shelves
  end
end
