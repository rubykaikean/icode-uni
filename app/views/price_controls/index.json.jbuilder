json.array!(@price_controls) do |price_control|
  json.extract! price_control, :pp_no, :pp_data, :client_id, :reference, :user_id
  json.url price_control_url(price_control, format: :json)
end
