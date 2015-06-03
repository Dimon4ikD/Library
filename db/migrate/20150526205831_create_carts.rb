class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      # t.references :books

      t.timestamps null: false
    end
  end
end
