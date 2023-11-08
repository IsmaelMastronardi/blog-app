require 'rails_helper'

RSpec.describe 'User Index page', type: :system do
    before(:each) do
        driven_by(:rack_test)
        first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
        second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
        first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
        all_users = User.all
        all_users.each {|us|puts us.id}
        visit root_path
      end
      describe 'checks the users' do
        it 'shows the right names' do
          expect(page).to have_content('Tom')
        end
        it 'shows the right images' do
          expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
        end
        it 'shows the number of posts for each user' do
          expect(page).to have_content('number of posts: 1')
          expect(page).to have_content('number of posts: 0')
        end
      end
      describe 'redirects to the correct users show page' do
        it 'redirects to Tom show page' do
          click_link('Tom')
          expect(page).to have_current_path(user_path(User.find_by(name: 'Tom')))
        end
        it 'redirects to Lilly show page' do
          click_link('Lilly')
          expect(page).to have_current_path(user_path(User.find_by(name: 'Lilly')))
        end
      end
end
