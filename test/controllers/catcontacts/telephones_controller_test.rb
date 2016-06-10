require 'test_helper'

module Catcontacts
  class TelephonesControllerTest < ActionController::TestCase
    setup do
      @telephone = catcontacts_telephones(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:telephones)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create telephone" do
      assert_difference('Telephone.count') do
        post :create, telephone: { contact_id: @telephone.contact_id, description: @telephone.description, number: @telephone.number, textable: @telephone.textable }
      end

      assert_redirected_to telephone_path(assigns(:telephone))
    end

    test "should show telephone" do
      get :show, id: @telephone
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @telephone
      assert_response :success
    end

    test "should update telephone" do
      patch :update, id: @telephone, telephone: { contact_id: @telephone.contact_id, description: @telephone.description, number: @telephone.number, textable: @telephone.textable }
      assert_redirected_to telephone_path(assigns(:telephone))
    end

    test "should destroy telephone" do
      assert_difference('Telephone.count', -1) do
        delete :destroy, id: @telephone
      end

      assert_redirected_to telephones_path
    end
  end
end
