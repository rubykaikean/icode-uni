json.array!(@stations) do |station|
  json.extract! station, :name, :product_id, :estimation_id
  json.url station_url(station, format: :json)
end
