require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get home_page_input_url
    assert_response :success
  end

  test "should get output" do
    get home_page_output_url
    assert_response :success
  end

end
