json.array!(@materials) do |material|
  json.extract! material, :name
  json.url material_url(material, format: :json)
end