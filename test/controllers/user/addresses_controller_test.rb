require "test_helper"

class User::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_addresses_index_url
    assert_response :success
  end

  test "should get create" do
    get user_addresses_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_addresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_addresses_destroy_url
    assert_response :success
  end
end
