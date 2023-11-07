require 'rails_helper'

RSpec.describe 'User Index page', type: :system do
  describe 'user index page' do
    it 'shows the rigth content' do
      visit root_path 
      sleep(5)
      expect(page).to have_content('number of posts')
    end
  end
end