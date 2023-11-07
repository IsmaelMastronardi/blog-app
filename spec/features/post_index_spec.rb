require 'rails_helper'

RSpec.describe 'User post index', type: :system do
  before(:each) do 
    driven_by(:rack_test)
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    fourth_post = Post.create(author: first_user, title: 'my fourth post', text: 'This is my fourth post text')
    third_post = Post.create(author: first_user, title: 'my third post', text: 'This is my third post text')
    second_post = Post.create(author: first_user, title: 'my second post', text: 'This is my second post text')
    first_post = Post.create(author: first_user, title: 'my first post', text: 'This is my first post text')
    Comment.create(post: first_post, user: second_user, text: 'Comment on first post' )
    Comment.create(post: second_post, user: second_user, text: 'First comment on second post' )
    Comment.create(post: second_post, user: second_user, text: 'Second comment on second post' )
    Like.create(user:second_user, post: first_post)
    
    visit user_posts_path(User.find_by(name: 'Tom'))
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
  end
  describe 'checks the posts atributes' do
    it 'shows the posts titles' do
      expect(page).to have_content('my first post')
      expect(page).to have_content('my second post')
      expect(page).to have_content('my third post')
      expect(page).to have_content('my fourth post')
    end
    it 'shows the posts texts' do
      expect(page).to have_content('This is my first post text')
      expect(page).to have_content('This is my second post text')
      expect(page).to have_content('This is my third post text')
      expect(page).to have_content('This is my fourth post text')
    end
    it 'shows how many comments for the posts' do
      expect(page).to have_content('Comment on first post')
      expect(page).to have_content('First comment on second post')
      expect(page).to have_content('Second comment on second post')
    end
    it 'shows how many comments and likes  a post has' do
      expect(page).to have_content('Comments: 1 Likes: 1')
      expect(page).to have_content('Comments: 2 Likes: 0')
      expect(page).to have_content('Comments: 0 Likes: 0')
    end
    it 'redirects when clicking on a post' do
      click_link('my first post')
      expect(page).to have_current_path(user_post_path(User.find_by(name: 'Tom'), Post.find_by(title: 'my first post')))
    end
  end
end
