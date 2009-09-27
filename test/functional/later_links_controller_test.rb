require 'test_helper'

class LaterLinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:later_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create later_link" do
    assert_difference('LaterLink.count') do
      post :create, :later_link => { }
    end

    assert_redirected_to later_link_path(assigns(:later_link))
  end

  test "should show later_link" do
    get :show, :id => later_links(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => later_links(:one).to_param
    assert_response :success
  end

  test "should update later_link" do
    put :update, :id => later_links(:one).to_param, :later_link => { }
    assert_redirected_to later_link_path(assigns(:later_link))
  end

  test "should destroy later_link" do
    assert_difference('LaterLink.count', -1) do
      delete :destroy, :id => later_links(:one).to_param
    end

    assert_redirected_to later_links_path
  end
end
