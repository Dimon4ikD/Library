json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :quantity, :price, :Cart_id, :Book_exemplar_id
  json.url line_item_url(line_item, format: :json)
end
