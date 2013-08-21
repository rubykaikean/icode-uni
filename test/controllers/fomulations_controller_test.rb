require 'test_helper'

class FomulationsControllerTest < ActionController::TestCase
  setup do
    @fomulation = fomulations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fomulations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fomulation" do
    assert_difference('Fomulation.count') do
      post :create, fomulation: { dimension_l: @fomulation.dimension_l, dimension_w: @fomulation.dimension_w, thk: @fomulation.thk, wt_ibs_ft: @fomulation.wt_ibs_ft }
    end

    assert_redirected_to fomulation_path(assigns(:fomulation))
  end

  test "should show fomulation" do
    get :show, id: @fomulation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fomulation
    assert_response :success
  end

  test "should update fomulation" do
    patch :update, id: @fomulation, fomulation: { dimension_l: @fomulation.dimension_l, dimension_w: @fomulation.dimension_w, thk: @fomulation.thk, wt_ibs_ft: @fomulation.wt_ibs_ft }
    assert_redirected_to fomulation_path(assigns(:fomulation))
  end

  test "should destroy fomulation" do
    assert_difference('Fomulation.count', -1) do
      delete :destroy, id: @fomulation
    end

    assert_redirected_to fomulations_path
  end
end
