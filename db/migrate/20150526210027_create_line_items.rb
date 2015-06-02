class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :price, precision: 15, scale: 2
      t.references :cart, index: true
      t.references :book_exemplar, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :Carts
    add_foreign_key :line_items, :Book_exemplars
  end
end
