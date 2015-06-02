json.array!(@users) do |user|
  json.extract! user, :id, :login, :phone, :address, :role, :name
  json.url user_url(user, format: :json)
end
