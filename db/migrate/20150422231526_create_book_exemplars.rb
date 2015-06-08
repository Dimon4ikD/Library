class CreateBookExemplars < ActiveRecord::Migration
  def change
    create_table :book_exemplars do |t|
      t.references :book, index: true
      t.references :user
      t.timestamps null: false

      belongs_to :books

    end
    add_foreign_key :book_exemplars, :books
    add_foreign_key :book_exemplars, :users
  end
end
