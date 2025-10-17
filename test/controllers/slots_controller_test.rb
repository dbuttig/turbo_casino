require "test_helper"

class SlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get slots_path
    assert_response :success
  end

  test "should post spin" do
    post spin_slots_path
    assert_response :redirect
  end

  test "should spin with turbo stream" do
    post spin_slots_path, headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :success
  end
end
