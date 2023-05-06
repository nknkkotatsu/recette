require "test_helper"

class Worker::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worker_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get worker_genres_edit_url
    assert_response :success
  end
end
