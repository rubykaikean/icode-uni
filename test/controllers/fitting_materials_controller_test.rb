require 'test_helper'

class FittingMaterialsControllerTest < ActionController::TestCase
  setup do
    @fitting_material = fitting_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fitting_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fitting_material" do
    assert_difference('FittingMaterial.count') do
      post :create, fitting_material: { air_flow: @fitting_material.air_flow, brand: @fitting_material.brand, fan_speed: @fitting_material.fan_speed, head: @fitting_material.head, material_type: @fitting_material.material_type, model: @fitting_material.model, motor_pole: @fitting_material.motor_pole, motor_power: @fitting_material.motor_power, name: @fitting_material.name, other: @fitting_material.other, pump_capacity: @fitting_material.pump_capacity, pump_speed: @fitting_material.pump_speed, remark: @fitting_material.remark, static_pressure: @fitting_material.static_pressure, thk_dia: @fitting_material.thk_dia, type: @fitting_material.type }
    end

    assert_redirected_to fitting_material_path(assigns(:fitting_material))
  end

  test "should show fitting_material" do
    get :show, id: @fitting_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fitting_material
    assert_response :success
  end

  test "should update fitting_material" do
    patch :update, id: @fitting_material, fitting_material: { air_flow: @fitting_material.air_flow, brand: @fitting_material.brand, fan_speed: @fitting_material.fan_speed, head: @fitting_material.head, material_type: @fitting_material.material_type, model: @fitting_material.model, motor_pole: @fitting_material.motor_pole, motor_power: @fitting_material.motor_power, name: @fitting_material.name, other: @fitting_material.other, pump_capacity: @fitting_material.pump_capacity, pump_speed: @fitting_material.pump_speed, remark: @fitting_material.remark, static_pressure: @fitting_material.static_pressure, thk_dia: @fitting_material.thk_dia, type: @fitting_material.type }
    assert_redirected_to fitting_material_path(assigns(:fitting_material))
  end

  test "should destroy fitting_material" do
    assert_difference('FittingMaterial.count', -1) do
      delete :destroy, id: @fitting_material
    end

    assert_redirected_to fitting_materials_path
  end
end
