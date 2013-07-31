require 'test_helper'

class EstimationItemsControllerTest < ActionController::TestCase
  setup do
    @estimation_item = estimation_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimation_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimation_item" do
    assert_difference('EstimationItem.count') do
      post :create, estimation_item: { dimension_h: @estimation_item.dimension_h, dimension_l: @estimation_item.dimension_l, dimension_w: @estimation_item.dimension_w, material: @estimation_item.material, part_detail: @estimation_item.part_detail, qty: @estimation_item.qty, remarks: @estimation_item.remarks, thk_dia: @estimation_item.thk_dia, unit_price: @estimation_item.unit_price, uom: @estimation_item.uom, weight: @estimation_item.weight, wt_ibs_ft: @estimation_item.wt_ibs_ft }
    end

    assert_redirected_to estimation_item_path(assigns(:estimation_item))
  end

  test "should show estimation_item" do
    get :show, id: @estimation_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimation_item
    assert_response :success
  end

  test "should update estimation_item" do
    patch :update, id: @estimation_item, estimation_item: { dimension_h: @estimation_item.dimension_h, dimension_l: @estimation_item.dimension_l, dimension_w: @estimation_item.dimension_w, material: @estimation_item.material, part_detail: @estimation_item.part_detail, qty: @estimation_item.qty, remarks: @estimation_item.remarks, thk_dia: @estimation_item.thk_dia, unit_price: @estimation_item.unit_price, uom: @estimation_item.uom, weight: @estimation_item.weight, wt_ibs_ft: @estimation_item.wt_ibs_ft }
    assert_redirected_to estimation_item_path(assigns(:estimation_item))
  end

  test "should destroy estimation_item" do
    assert_difference('EstimationItem.count', -1) do
      delete :destroy, id: @estimation_item
    end

    assert_redirected_to estimation_items_path
  end
end
