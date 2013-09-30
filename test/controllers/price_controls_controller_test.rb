require 'test_helper'

class PriceControlsControllerTest < ActionController::TestCase
  setup do
    @price_control = price_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_control" do
    assert_difference('PriceControl.count') do
      post :create, price_control: { client_id: @price_control.client_id, pp_data: @price_control.pp_data, pp_no: @price_control.pp_no, reference: @price_control.reference, user_id: @price_control.user_id }
    end

    assert_redirected_to price_control_path(assigns(:price_control))
  end

  test "should show price_control" do
    get :show, id: @price_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price_control
    assert_response :success
  end

  test "should update price_control" do
    patch :update, id: @price_control, price_control: { client_id: @price_control.client_id, pp_data: @price_control.pp_data, pp_no: @price_control.pp_no, reference: @price_control.reference, user_id: @price_control.user_id }
    assert_redirected_to price_control_path(assigns(:price_control))
  end

  test "should destroy price_control" do
    assert_difference('PriceControl.count', -1) do
      delete :destroy, id: @price_control
    end

    assert_redirected_to price_controls_path
  end
end
