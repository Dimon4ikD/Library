class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :cupboard_number
      t.integer :storey_number
      t.integer :shelf_number

      t.timestamps null: false
    end
  end
end
