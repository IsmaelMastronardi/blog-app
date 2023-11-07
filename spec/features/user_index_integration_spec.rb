require 'rails_helper'

RSpec.describe 'User Index page', type: :system do
  fixtures :users

  describe 'user index page' do
    it 'shows the right content' do
      visit root_path 
      sleep(5)
      expect(page).to have_content('user 1')
    end
  end
end
