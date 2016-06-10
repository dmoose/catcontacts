require 'test_helper'

module Catcontacts
  class AddressesControllerTest < ActionController::TestCase
    setup do
      @address = catcontacts_addresses(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:addresses)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create address" do
      assert_difference('Address.count') do
        post :create, address: { aline1: @address.aline1, aline2: @address.aline2, aline2: @address.aline2, city: @address.city, country: @address.country, county: @address.county, postal: @address.postal, region: @address.region }
      end

      assert_redirected_to address_path(assigns(:address))
    end

    test "should show address" do
      get :show, id: @address
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @address
      assert_response :success
    end

    test "should update address" do
      patch :update, id: @address, address: { aline1: @address.aline1, aline2: @address.aline2, aline2: @address.aline2, city: @address.city, country: @address.country, county: @address.county, postal: @address.postal, region: @address.region }
      assert_redirected_to address_path(assigns(:address))
    end

    test "should destroy address" do
      assert_difference('Address.count', -1) do
        delete :destroy, id: @address
      end

      assert_redirected_to addresses_path
    end
  end
end
