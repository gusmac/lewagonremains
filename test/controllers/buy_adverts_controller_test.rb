require 'test_helper'

class BuyAdvertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buy_adverts_index_url
    assert_response :success
  end

  test "should get editcreate" do
    get buy_adverts_editcreate_url
    assert_response :success
  end

  test "should get update" do
    get buy_adverts_update_url
    assert_response :success
  end

  test "should get show" do
    get buy_adverts_show_url
    assert_response :success
  end

  test "should get new" do
    get buy_adverts_new_url
    assert_response :success
  end

  test "should get destroy" do
    get buy_adverts_destroy_url
    assert_response :success
  end

end
