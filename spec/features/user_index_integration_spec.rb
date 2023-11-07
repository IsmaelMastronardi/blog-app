require 'rails_helper'

RSpec.describe 'User Index page', type: :system do
  fixtures :users

  describe 'checks the users' do
    it 'shows the right names' do
      visit root_path 
      expect(page).to have_content('user 1')
      expect(page).to have_content('user 2')
    end
    it 'shows the right images' do
      visit root_path 
      image = find('img.object-cover', match: :first)
      actual_src = image[:src]
      expected_src = users(:one).photo
      expect(actual_src).to include(expected_src)
    end
    it 'shows the number of posts for each user' do
      visit root_path
      sleep(2)
      expect(page).to have_content('number of posts: 3')
    end
  end
end
