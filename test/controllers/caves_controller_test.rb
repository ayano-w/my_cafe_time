require 'test_helper'

class CavesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get caves_new_url
    assert_response :success
  end

  test "should get edit" do
    get caves_edit_url
    assert_response :success
  end

end
