require 'test_helper'

class SearchingsControllerTest < ActionController::TestCase
  setup do
    @searching = searchings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searchings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create searching" do
    assert_difference('Searching.count') do
      post :create, searching: @searching.attributes
    end

    assert_redirected_to searching_path(assigns(:searching))
  end

  test "should show searching" do
    get :show, id: @searching
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @searching
    assert_response :success
  end

  test "should update searching" do
    put :update, id: @searching, searching: @searching.attributes
    assert_redirected_to searching_path(assigns(:searching))
  end

  test "should destroy searching" do
    assert_difference('Searching.count', -1) do
      delete :destroy, id: @searching
    end

    assert_redirected_to searchings_path
  end
end
