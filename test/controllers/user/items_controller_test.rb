require "test_helper"

class User::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_items_edit_url
    assert_response :success
  end

  test "should get index" do
    get user_items_index_url
    assert_response :success
  end

  test "should get show" do
    get user_items_show_url
    assert_response :success
  end
end
