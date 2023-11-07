require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'my test' do
    visit root_path
    sleep(5)
    assert_text "number of posts"
  end
end