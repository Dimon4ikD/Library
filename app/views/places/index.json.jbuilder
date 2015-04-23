json.array!(@places) do |place|
  json.extract! place, :id, :cupboard_number, :storey_number, :shelf_number
  json.url place_url(place, format: :json)
end
