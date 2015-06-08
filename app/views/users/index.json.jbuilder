json.array!(@users) do |user|
  json.extract! user, :id, :email, :phone, :address, :role, :name
  json.url user_url(user, format: :json)
end
