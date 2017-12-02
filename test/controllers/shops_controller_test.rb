require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get shops_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_url
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post shops_url, params: { shop: { city: @shop.city, contact_email: @shop.contact_email, contact_name: @shop.contact_name, contact_phone: @shop.contact_phone, description: @shop.description, email: @shop.email, location: @shop.location, name: @shop.name, notes: @shop.notes, phone: @shop.phone, state: @shop.state, street1: @shop.street1, street2: @shop.street2, website: @shop.website, zip: @shop.zip } }
    end

    assert_redirected_to shop_url(Shop.last)
  end

  test "should show shop" do
    get shop_url(@shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_url(@shop)
    assert_response :success
  end

  test "should update shop" do
    patch shop_url(@shop), params: { shop: { city: @shop.city, contact_email: @shop.contact_email, contact_name: @shop.contact_name, contact_phone: @shop.contact_phone, description: @shop.description, email: @shop.email, location: @shop.location, name: @shop.name, notes: @shop.notes, phone: @shop.phone, state: @shop.state, street1: @shop.street1, street2: @shop.street2, website: @shop.website, zip: @shop.zip } }
    assert_redirected_to shop_url(@shop)
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
