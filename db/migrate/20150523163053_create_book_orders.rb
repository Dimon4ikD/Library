class CreateBookOrders < ActiveRecord::Migration
  def change
    create_table :book_orders do |t|
      t.belongs_to :user, index: true
      t.belongs_to :cart, index: true
      t.belongs_to :book, index: true
      t.text :comment
      t.text :address

      t.timestamps null: false
    end

    add_foreign_key :book_orders, :users
    add_foreign_key :book_orders, :carts
    add_foreign_key :book_orders, :books
  end
end


