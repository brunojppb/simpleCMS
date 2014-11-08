require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get adit" do
    get :adit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
