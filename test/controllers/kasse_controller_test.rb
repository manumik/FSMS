require 'test_helper'

class KasseControllerTest < ActionDispatch::IntegrationTest
  test "should get kasse" do
    get kasse_kasse_url
    assert_response :success
  end

end
