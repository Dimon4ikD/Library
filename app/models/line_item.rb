class LineItem < ActiveRecord::Base
  belongs_to :cart
  # belongs_to :book_exemplar

  belongs_to :book

  validates :book, presence: true
  validates :book_id, uniqueness: {scope: :cart_id}
  validates :cart, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :price, presence: true

  def total_price
    quantity*price
  end
end
