json.array!(@estimations) do |estimation|
  json.extract! estimation, :part_detail, :material, :thk_dia, :dimension_h, :dimension_w, :dimension_l, :remarks, :station_id
  json.url estimation_url(estimation, format: :json)
end