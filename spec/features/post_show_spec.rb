require 'rails_helper'

RSpec.describe 'User post index', type: :system do
  before(:each) do 
    driven_by(:rack_test)
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    third_user = User.create(name: 'Pablo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    first_post = Post.create(author: first_user, title: 'my first post', text: 'This is my first post text')
    Comment.create(post: first_post, user: second_user, text: 'First comment on first post' )
    Comment.create(post: first_post, user: second_user, text: 'Second comment on first post' )
    Comment.create(post: first_post, user: second_user, text: 'Third comment on first post' )
    Comment.create(post: first_post, user: third_user, text: 'Fourth comment on first post' )
    Like.create(user:second_user, post: first_post)
    
    visit user_post_path(User.find_by(name: 'Tom'), first_post)
  end
  describe 'checks the posts atributes' do
    it 'shows the post title' do
      expect(page).to have_content('my first post')
    end
    it 'shows who wrote the post' do
      expect(page).to have_content('by Tom')
    end
    it 'shows how many comments and likes  a post has' do
      expect(page).to have_content('Comments: 4')
    end
    it 'shows how many  likes a post has' do
      expect(page).to have_content('Likes: 1')
    end
    it 'shows the post body' do
      expect(page).to have_content('This is my first post text')
    end
    it 'shows the names of the commentors' do
      expect(page).to have_content('Lilly:')
      expect(page).to have_content('Pablo:')
    end
    it 'shows all the comments' do
      expect(page).to have_content('First comment on first post')
      expect(page).to have_content('Second comment on first post')
      expect(page).to have_content('Third comment on first post')
      expect(page).to have_content('Fourth comment on first post')
    end
  end
end