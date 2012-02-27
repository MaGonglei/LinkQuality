require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = test_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_task" do
    assert_difference('TestTask.count') do
      post :create, task: @task.attributes
    end

    assert_redirected_to test_task_path(assigns(:task))
  end

  test "should show test_task" do
    get :show, id: @task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task.to_param
    assert_response :success
  end

  test "should update test_task" do
    put :update, id: @task.to_param, task: @task.attributes
    assert_redirected_to test_task_path(assigns(:task))
  end

  test "should destroy test_task" do
    assert_difference('TestTask.count', -1) do
      delete :destroy, id: @task.to_param
    end

    assert_redirected_to test_tasks_path
  end
end
