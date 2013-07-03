json.array!(@drawings) do |drawing|
  json.extract! drawing, :name
  json.url drawing_url(drawing, format: :json)
end