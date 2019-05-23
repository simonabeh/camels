require 'test_helper'

class CamelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get camels_index_url
    assert_response :success
  end

  test "should get new" do
    get camels_new_url
    assert_response :success
  end

  test "should get create" do
    get camels_create_url
    assert_response :success
  end

  test "should get show" do
    get camels_show_url
    assert_response :success
  end

  test "should get edit" do
    get camels_edit_url
    assert_response :success
  end

  test "should get update" do
    get camels_update_url
    assert_response :success
  end

  test "should get delete" do
    get camels_delete_url
    assert_response :success
  end

end
