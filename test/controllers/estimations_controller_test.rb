require 'test_helper'

class EstimationsControllerTest < ActionController::TestCase
  setup do
    @estimation = estimations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimation" do
    assert_difference('Estimation.count') do
      post :create, estimation: { dimension_h: @estimation.dimension_h, dimension_l: @estimation.dimension_l, dimension_w: @estimation.dimension_w, material: @estimation.material, part_detail: @estimation.part_detail, remarks: @estimation.remarks, station_id: @estimation.station_id, thk_dia: @estimation.thk_dia }
    end

    assert_redirected_to estimation_path(assigns(:estimation))
  end

  test "should show estimation" do
    get :show, id: @estimation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimation
    assert_response :success
  end

  test "should update estimation" do
    patch :update, id: @estimation, estimation: { dimension_h: @estimation.dimension_h, dimension_l: @estimation.dimension_l, dimension_w: @estimation.dimension_w, material: @estimation.material, part_detail: @estimation.part_detail, remarks: @estimation.remarks, station_id: @estimation.station_id, thk_dia: @estimation.thk_dia }
    assert_redirected_to estimation_path(assigns(:estimation))
  end

  test "should destroy estimation" do
    assert_difference('Estimation.count', -1) do
      delete :destroy, id: @estimation
    end

    assert_redirected_to estimations_path
  end
end
