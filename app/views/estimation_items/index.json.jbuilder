json.array!(@estimation_items) do |estimation_item|
  json.extract! estimation_item, :part_detail, :material, :thk_dia, :dimension_h, :dimension_w, :dimension_l, :wt_ibs_ft, :qty, :uom, :weight, :unit_price, :remarks
  json.url estimation_item_url(estimation_item, format: :json)
end
