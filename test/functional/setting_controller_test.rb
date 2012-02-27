require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

end
