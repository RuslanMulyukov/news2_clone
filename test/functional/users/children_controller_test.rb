require 'test_helper'

class Users::ChildrenControllerTest < ActionController::TestCase
  setup do
    @users_child = users_children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_child" do
    assert_difference('Users::Child.count') do
      post :create, :users_child => @users_child.attributes
    end

    assert_redirected_to users_child_path(assigns(:users_child))
  end

  test "should show users_child" do
    get :show, :id => @users_child.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @users_child.to_param
    assert_response :success
  end

  test "should update users_child" do
    put :update, :id => @users_child.to_param, :users_child => @users_child.attributes
    assert_redirected_to users_child_path(assigns(:users_child))
  end

  test "should destroy users_child" do
    assert_difference('Users::Child.count', -1) do
      delete :destroy, :id => @users_child.to_param
    end

    assert_redirected_to users_children_path
  end
end
