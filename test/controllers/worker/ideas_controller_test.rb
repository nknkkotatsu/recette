require "test_helper"

class Worker::IdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get worker_ideas_new_url
    assert_response :success
  end

  test "should get index" do
    get worker_ideas_index_url
    assert_response :success
  end

  test "should get show" do
    get worker_ideas_show_url
    assert_response :success
  end

  test "should get edit" do
    get worker_ideas_edit_url
    assert_response :success
  end
end
