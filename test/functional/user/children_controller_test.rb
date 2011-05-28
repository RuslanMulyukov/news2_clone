require 'test_helper'

class User::ChildrenControllerTest < ActionController::TestCase
  setup do
    @user_child = user_children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_child" do
    assert_difference('User::Child.count') do
      post :create, :user_child => @user_child.attributes
    end

    assert_redirected_to user_child_path(assigns(:user_child))
  end

  test "should show user_child" do
    get :show, :id => @user_child.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_child.to_param
    assert_response :success
  end

  test "should update user_child" do
    put :update, :id => @user_child.to_param, :user_child => @user_child.attributes
    assert_redirected_to user_child_path(assigns(:user_child))
  end

  test "should destroy user_child" do
    assert_difference('User::Child.count', -1) do
      delete :destroy, :id => @user_child.to_param
    end

    assert_redirected_to user_children_path
  end
end
