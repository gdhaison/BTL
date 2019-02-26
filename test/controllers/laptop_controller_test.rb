require 'test_helper'

class LaptopControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get laptop_new_url
    assert_response :success
  end

end
