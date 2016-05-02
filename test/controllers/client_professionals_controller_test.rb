require 'test_helper'

class ClientProfessionalsControllerTest < ActionController::TestCase
  setup do
    @client_professional = client_professionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_professionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_professional" do
    assert_difference('ClientProfessional.count') do
      post :create, client_professional: { client_id: @client_professional.client_id, creator: @client_professional.creator, name: @client_professional.name, professional_id: @client_professional.professional_id }
    end

    assert_redirected_to client_professional_path(assigns(:client_professional))
  end

  test "should show client_professional" do
    get :show, id: @client_professional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_professional
    assert_response :success
  end

  test "should update client_professional" do
    patch :update, id: @client_professional, client_professional: { client_id: @client_professional.client_id, creator: @client_professional.creator, name: @client_professional.name, professional_id: @client_professional.professional_id }
    assert_redirected_to client_professional_path(assigns(:client_professional))
  end

  test "should destroy client_professional" do
    assert_difference('ClientProfessional.count', -1) do
      delete :destroy, id: @client_professional
    end

    assert_redirected_to client_professionals_path
  end
end
