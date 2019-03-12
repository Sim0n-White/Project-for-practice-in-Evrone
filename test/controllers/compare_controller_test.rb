require 'test_helper'

class CompareControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get compare_input_url
    assert_response :success
  end

  test "should get output" do
    get compare_output_url
    assert_response :success
  end

end
