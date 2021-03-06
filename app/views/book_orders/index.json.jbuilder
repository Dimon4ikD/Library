json.array!(@book_orders) do |book_order|
  json.extract! book_order, :id, :user_id, :book_id, :comment
  json.url book_order_url(book_order, format: :json)
end
