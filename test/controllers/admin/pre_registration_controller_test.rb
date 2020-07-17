require 'test_helper'

class Admin::PreRegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pre_registration_index_url
    assert_response :success
  end

end
