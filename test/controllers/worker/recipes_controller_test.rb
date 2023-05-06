require "test_helper"

class Worker::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get worker_recipes_new_url
    assert_response :success
  end

  test "should get index" do
    get worker_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get worker_recipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get worker_recipes_edit_url
    assert_response :success
  end
end
