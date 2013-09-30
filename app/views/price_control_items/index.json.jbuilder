json.array!(@price_control_items) do |price_control_item|
  json.extract! price_control_item, :material_id, :old_unit_price, :old_eff_date, :new_unit_price, :new_eff_date, :price_control_id
  json.url price_control_item_url(price_control_item, format: :json)
end
