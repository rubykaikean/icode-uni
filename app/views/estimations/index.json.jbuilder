json.array!(@estimations) do |estimation|
  json.extract! estimation, :client_id, :title, :dimension, :drawing_no, :date, :issued_by
  json.url estimation_url(estimation, format: :json)
end
