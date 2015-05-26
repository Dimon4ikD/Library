class CreateBookExemplars < ActiveRecord::Migration
  def change
    create_table :book_exemplars do |t|
      t.references :book, index: true
      t.timestamps null: false
    end
    add_foreign_key :book_exemplars, :books
  end
end
