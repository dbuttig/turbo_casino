require "test_helper"

class CasinoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get casino_path
    assert_response :success
  end
end
