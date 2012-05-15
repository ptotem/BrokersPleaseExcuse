require 'test_helper'

class DataEntryControllerTest < ActionController::TestCase
  test "should get building" do
    get :building
    assert_response :success
  end

  test "should get flat" do
    get :flat
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
