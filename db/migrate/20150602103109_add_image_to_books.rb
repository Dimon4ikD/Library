class AddImageToBooks < ActiveRecord::Migration
  def change
    add_attachment :books, :image, :attachment
  end
end
