require 'test_helper'

class SubControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sub_new_url
    assert_response :success
  end

  test "should get create" do
    get sub_create_url
    assert_response :success
  end

  test "should get edit" do
    get sub_edit_url
    assert_response :success
  end

  test "should get update" do
    get sub_update_url
    assert_response :success
  end

  test "should get index" do
    get sub_index_url
    assert_response :success
  end

  test "should get show" do
    get sub_show_url
    assert_response :success
  end

  test "should get destroy" do
    get sub_destroy_url
    assert_response :success
  end

end
