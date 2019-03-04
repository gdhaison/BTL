require 'test_helper'

class LaptopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get laptops_new_url
    assert_response :success
  end

end
