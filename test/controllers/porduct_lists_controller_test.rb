require 'test_helper'

class PorductListsControllerTest < ActionController::TestCase
  setup do
    @porduct_list = porduct_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:porduct_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create porduct_list" do
    assert_difference('PorductList.count') do
      post :create, porduct_list: { batch_no: @porduct_list.batch_no, client_id: @porduct_list.client_id, description: @porduct_list.description, issue_by: @porduct_list.issue_by, issue_date: @porduct_list.issue_date, name: @porduct_list.name, qty: @porduct_list.qty, remark: @porduct_list.remark }
    end

    assert_redirected_to porduct_list_path(assigns(:porduct_list))
  end

  test "should show porduct_list" do
    get :show, id: @porduct_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @porduct_list
    assert_response :success
  end

  test "should update porduct_list" do
    patch :update, id: @porduct_list, porduct_list: { batch_no: @porduct_list.batch_no, client_id: @porduct_list.client_id, description: @porduct_list.description, issue_by: @porduct_list.issue_by, issue_date: @porduct_list.issue_date, name: @porduct_list.name, qty: @porduct_list.qty, remark: @porduct_list.remark }
    assert_redirected_to porduct_list_path(assigns(:porduct_list))
  end

  test "should destroy porduct_list" do
    assert_difference('PorductList.count', -1) do
      delete :destroy, id: @porduct_list
    end

    assert_redirected_to porduct_lists_path
  end
end
