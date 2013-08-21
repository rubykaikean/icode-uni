json.array!(@fomulations) do |fomulation|
  json.extract! fomulation, :thk, :dimension_w, :dimension_l, :wt_ibs_ft
  json.url fomulation_url(fomulation, format: :json)
end
