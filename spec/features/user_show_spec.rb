require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  before(:each) do
    driven_by(:rack_test)
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Poland.')
    Post.create(author: first_user, title: 'my fourth post', text: 'This is my fourth post text')
    Post.create(author: first_user, title: 'my third post', text: 'This is my third post text')
    Post.create(author: first_user, title: 'my second post', text: 'This is my second post text')
    Post.create(author: first_user, title: 'my first post', text: 'This is my first post text')


    visit user_path(User.find_by(name: 'Tom'))
  end

  describe 'checks the users atributes' do
    it 'shows the right name' do
      expect(page).to have_content('Tom')
    end
    it 'shows the right image' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end
    it 'shows the number of posts for the user' do
      expect(page).to have_content('number of posts: 4')
    end
    it 'shows the user Bio' do
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'shows the first 3 posts' do
      expect(page).to have_content('my first post')
      expect(page).to have_content('my second post')
      expect(page).to have_content('my third post')
    end
  end
  describe 'button interactions' do
    it 'checks that buttons exists' do
      expect(page).to have_button('See all posts')
      expect(page).to have_button('Make a Post')
    end
    it 'redirects to all posts page' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(User.find_by(name: 'Tom')))
    end
    it 'redirects to new post page' do
      click_link('Make a Post')
      expect(page).to have_current_path(new_user_post_path(User.find_by(name: 'Tom')))
    end
  end
end
