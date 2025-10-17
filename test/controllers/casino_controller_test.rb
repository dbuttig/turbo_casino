require "test_helper"

class CasinoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get casino_index_url
    assert_response :success
  end
end
