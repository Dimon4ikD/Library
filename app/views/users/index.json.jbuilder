json.array!(@users) do |user|
  json.extract! user, :id, :login, :password, :phone, :address, :role, :name
  json.url user_url(user, format: :json)
end
