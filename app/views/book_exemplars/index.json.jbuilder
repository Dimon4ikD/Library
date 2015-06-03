json.array!(@book_exemplars) do |book_exemplar|
  json.extract! book_exemplar, :id, :book_id
  json.url book_exemplar_url(book_exemplar, format: :json)
end
