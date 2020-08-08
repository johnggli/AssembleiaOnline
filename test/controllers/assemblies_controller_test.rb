require 'test_helper'

class AssembliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assembly = assemblies(:one)
  end

  test "should get index" do
    get assemblies_url
    assert_response :success
  end

  test "should get new" do
    get new_assembly_url
    assert_response :success
  end

  test "should create assembly" do
    assert_difference('Assembly.count') do
      post assemblies_url, params: { assembly: { description: @assembly.description, finish_time: @assembly.finish_time, start_time: @assembly.start_time, status: @assembly.status, title: @assembly.title, topics_count: @assembly.topics_count, url_ata: @assembly.url_ata } }
    end

    assert_redirected_to assembly_url(Assembly.last)
  end

  test "should show assembly" do
    get assembly_url(@assembly)
    assert_response :success
  end

  test "should get edit" do
    get edit_assembly_url(@assembly)
    assert_response :success
  end

  test "should update assembly" do
    patch assembly_url(@assembly), params: { assembly: { description: @assembly.description, finish_time: @assembly.finish_time, start_time: @assembly.start_time, status: @assembly.status, title: @assembly.title, topics_count: @assembly.topics_count, url_ata: @assembly.url_ata } }
    assert_redirected_to assembly_url(@assembly)
  end

  test "should destroy assembly" do
    assert_difference('Assembly.count', -1) do
      delete assembly_url(@assembly)
    end

    assert_redirected_to assemblies_url
  end
end
