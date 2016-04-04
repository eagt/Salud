require 'test_helper'

class AssaigmentsControllerTest < ActionController::TestCase
  setup do
    @assaigment = assaigments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assaigments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assaigment" do
    assert_difference('Assaigment.count') do
      post :create, assaigment: { appointment_id: @assaigment.appointment_id, creator: @assaigment.creator, professional_id: @assaigment.professional_id }
    end

    assert_redirected_to assaigment_path(assigns(:assaigment))
  end

  test "should show assaigment" do
    get :show, id: @assaigment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assaigment
    assert_response :success
  end

  test "should update assaigment" do
    patch :update, id: @assaigment, assaigment: { appointment_id: @assaigment.appointment_id, creator: @assaigment.creator, professional_id: @assaigment.professional_id }
    assert_redirected_to assaigment_path(assigns(:assaigment))
  end

  test "should destroy assaigment" do
    assert_difference('Assaigment.count', -1) do
      delete :destroy, id: @assaigment
    end

    assert_redirected_to assaigments_path
  end
end
