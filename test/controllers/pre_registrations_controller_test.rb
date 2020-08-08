require 'test_helper'

class PreRegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pre_registration = pre_registrations(:one)
  end

  test "should get index" do
    get pre_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_pre_registration_url
    assert_response :success
  end

  test "should create pre_registration" do
    assert_difference('PreRegistration.count') do
      post pre_registrations_url, params: { pre_registration: { ap: @pre_registration.ap, bloc: @pre_registration.bloc, cpf: @pre_registration.cpf } }
    end

    assert_redirected_to pre_registration_url(PreRegistration.last)
  end

  test "should show pre_registration" do
    get pre_registration_url(@pre_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_pre_registration_url(@pre_registration)
    assert_response :success
  end

  test "should update pre_registration" do
    patch pre_registration_url(@pre_registration), params: { pre_registration: { ap: @pre_registration.ap, bloc: @pre_registration.bloc, cpf: @pre_registration.cpf } }
    assert_redirected_to pre_registration_url(@pre_registration)
  end

  test "should destroy pre_registration" do
    assert_difference('PreRegistration.count', -1) do
      delete pre_registration_url(@pre_registration)
    end

    assert_redirected_to pre_registrations_url
  end
end
