require 'test_helper'

class DealStagesControllerTest < ActionController::TestCase
  setup do
    @deal_stage = deal_stages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deal_stages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal_stage" do
    assert_difference('DealStage.count') do
      post :create, deal_stage: @deal_stage.attributes
    end

    assert_redirected_to deal_stage_path(assigns(:deal_stage))
  end

  test "should show deal_stage" do
    get :show, id: @deal_stage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deal_stage
    assert_response :success
  end

  test "should update deal_stage" do
    put :update, id: @deal_stage, deal_stage: @deal_stage.attributes
    assert_redirected_to deal_stage_path(assigns(:deal_stage))
  end

  test "should destroy deal_stage" do
    assert_difference('DealStage.count', -1) do
      delete :destroy, id: @deal_stage
    end

    assert_redirected_to deal_stages_path
  end
end
