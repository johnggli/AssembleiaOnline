require 'test_helper'

class User::AssembliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assemblies_index_url
    assert_response :success
  end

end
