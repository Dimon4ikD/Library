class CreateBookOrders < ActiveRecord::Migration
  def change
    create_table :book_orders do |t|
      t.references :user, index: true
      t.references :book_exemplar, index: true

      t.timestamps null: false
    end
    add_foreign_key :book_orders, :users
    add_foreign_key :book_orders, :book_exemplars
  end
end
