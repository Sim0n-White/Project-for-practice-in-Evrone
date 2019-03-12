require 'test_helper'

class LookcharControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lookchar_input_url
    assert_response :success
  end

  test "should get output" do
    get lookchar_output_url
    assert_response :success
  end

end
