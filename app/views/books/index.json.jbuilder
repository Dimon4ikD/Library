json.array!(@books) do |book|
  json.extract! book, :id, :name, :amount, :year, :author, :pages_amount, :isbn, :udc, :lbc, :price,:description
  json.url book_url(book, format: :json)
end
