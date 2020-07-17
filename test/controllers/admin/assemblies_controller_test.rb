require 'test_helper'

class Admin::AssembliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_assemblies_index_url
    assert_response :success
  end

end
