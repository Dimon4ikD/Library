class AddImageToBooks < ActiveRecord::Migration
  def change
    add_attachment :books, :image, :attachment #, default: ("blank_book.jpg")
  end
end
