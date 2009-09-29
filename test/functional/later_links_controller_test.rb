require 'test_helper'

class LaterLinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:later_links)
  end
end
