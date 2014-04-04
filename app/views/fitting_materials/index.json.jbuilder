json.array!(@fitting_materials) do |fitting_material|
  json.extract! fitting_material, :name, :thk_dia, :brand, :modal, :type_1, :pump_capacity, :head, :material_type, :pump_speed, :fan_speed, :motor_power, :motor_pole, :air_flow, :static_pressure, :other, :remark
  json.url fitting_material_url(fitting_material, format: :json)
end
