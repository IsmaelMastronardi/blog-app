require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users()
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should show root" do
    get users_url
    assert_select "h1", "lists of users"
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get correct view" do
    get user_url(@user)
    assert_select "h1", "The  specific user"
  end

  test "should render the 'show' template" do
    get user_url(@user)

  end
end
