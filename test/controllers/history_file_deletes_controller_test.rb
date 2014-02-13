require 'test_helper'

class HistoryFileDeletesControllerTest < ActionController::TestCase
  setup do
    @history_file_delete = history_file_deletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:history_file_deletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create history_file_delete" do
    assert_difference('HistoryFileDelete.count') do
      post :create, history_file_delete: { estimation_id: @history_file_delete.estimation_id }
    end

    assert_redirected_to history_file_delete_path(assigns(:history_file_delete))
  end

  test "should show history_file_delete" do
    get :show, id: @history_file_delete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @history_file_delete
    assert_response :success
  end

  test "should update history_file_delete" do
    patch :update, id: @history_file_delete, history_file_delete: { estimation_id: @history_file_delete.estimation_id }
    assert_redirected_to history_file_delete_path(assigns(:history_file_delete))
  end

  test "should destroy history_file_delete" do
    assert_difference('HistoryFileDelete.count', -1) do
      delete :destroy, id: @history_file_delete
    end

    assert_redirected_to history_file_deletes_path
  end
end
