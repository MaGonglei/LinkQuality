require 'test_helper'

class TestTasksControllerTest < ActionController::TestCase
  setup do
    @test_task = test_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_task" do
    assert_difference('TestTask.count') do
      post :create, test_task: @test_task.attributes
    end

    assert_redirected_to test_task_path(assigns(:test_task))
  end

  test "should show test_task" do
    get :show, id: @test_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_task.to_param
    assert_response :success
  end

  test "should update test_task" do
    put :update, id: @test_task.to_param, test_task: @test_task.attributes
    assert_redirected_to test_task_path(assigns(:test_task))
  end

  test "should destroy test_task" do
    assert_difference('TestTask.count', -1) do
      delete :destroy, id: @test_task.to_param
    end

    assert_redirected_to test_tasks_path
  end
end
