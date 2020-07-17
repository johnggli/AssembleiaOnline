require 'test_helper'

class Admin::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_topics_index_url
    assert_response :success
  end

end
