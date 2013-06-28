json.array!(@users) do |user|
  json.extract! user, :username
  json.url user_url(user, format: :json)
end