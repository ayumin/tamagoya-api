require 'test_helper'

class MenusControllerControllerTest < ActionController::TestCase
  test "should get today" do
    get :today
    assert_response :success
  end

  test "should get date" do
    get :date
    assert_response :success
  end

  test "should get all" do
    get :all
    assert_response :success
  end

end
