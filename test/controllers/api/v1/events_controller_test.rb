require "test_helper"

class Api::V1::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_events_index_url
    assert_response :success
  end

  test "should get read" do
    get api_v1_events_read_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_events_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_events_destroy_url
    assert_response :success
  end
end
