require 'test_helper'

class ProductListsControllerTest < ActionController::TestCase
  setup do
    @product_list = product_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_list" do
    assert_difference('ProductList.count') do
      post :create, product_list: { batch_no: @product_list.batch_no, client_id: @product_list.client_id, description: @product_list.description, estimation_no: @product_list.estimation_no, issue_by: @product_list.issue_by, issue_date: @product_list.issue_date, qty: @product_list.qty, remark: @product_list.remark }
    end

    assert_redirected_to product_list_path(assigns(:product_list))
  end

  test "should show product_list" do
    get :show, id: @product_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_list
    assert_response :success
  end

  test "should update product_list" do
    patch :update, id: @product_list, product_list: { batch_no: @product_list.batch_no, client_id: @product_list.client_id, description: @product_list.description, estimation_no: @product_list.estimation_no, issue_by: @product_list.issue_by, issue_date: @product_list.issue_date, qty: @product_list.qty, remark: @product_list.remark }
    assert_redirected_to product_list_path(assigns(:product_list))
  end

  test "should destroy product_list" do
    assert_difference('ProductList.count', -1) do
      delete :destroy, id: @product_list
    end

    assert_redirected_to product_lists_path
  end
end
