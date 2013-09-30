require 'test_helper'

class PriceControlItemsControllerTest < ActionController::TestCase
  setup do
    @price_control_item = price_control_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_control_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_control_item" do
    assert_difference('PriceControlItem.count') do
      post :create, price_control_item: { material_id: @price_control_item.material_id, new_eff_date: @price_control_item.new_eff_date, new_unit_price: @price_control_item.new_unit_price, old_eff_date: @price_control_item.old_eff_date, old_unit_price: @price_control_item.old_unit_price, price_control_id: @price_control_item.price_control_id }
    end

    assert_redirected_to price_control_item_path(assigns(:price_control_item))
  end

  test "should show price_control_item" do
    get :show, id: @price_control_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price_control_item
    assert_response :success
  end

  test "should update price_control_item" do
    patch :update, id: @price_control_item, price_control_item: { material_id: @price_control_item.material_id, new_eff_date: @price_control_item.new_eff_date, new_unit_price: @price_control_item.new_unit_price, old_eff_date: @price_control_item.old_eff_date, old_unit_price: @price_control_item.old_unit_price, price_control_id: @price_control_item.price_control_id }
    assert_redirected_to price_control_item_path(assigns(:price_control_item))
  end

  test "should destroy price_control_item" do
    assert_difference('PriceControlItem.count', -1) do
      delete :destroy, id: @price_control_item
    end

    assert_redirected_to price_control_items_path
  end
end
