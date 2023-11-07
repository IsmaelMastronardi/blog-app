require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  before(:each) do
    fixtures :users
  end
  test 'my test' do
    visit root_path
    sleep(5)
    assert_text "user 1"
  end
end