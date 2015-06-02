class BookExemplar < ActiveRecord::Base
  belongs_to :book
  has_many :line_items, dependent: :nullify

end
