require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it 'is not valid without a title' do
    first_post = Post.create(author: first_user, title: '', text: 'This is my first post')
    
    expect(first_post).not_to be_valid
  end

  it 'is not valid without a very long title' do
    long_title = 'A' * 251
    first_post = Post.create(author: first_user, title: long_title, text: 'This is my first post')
    
    expect(first_post).not_to be_valid
  end

  it 'is valid with a title' do
    first_post = Post.create(author: first_user, title: 'title', text: 'This is my first post')
    
    expect(first_post).to be_valid
  end

  it 'checks the post counters' do
    first_post = Post.create(author: first_user, title: 'title', text: 'This is my first post')
    Comment.create(post: first_post, user: first_user, text: 'Hi Tom!' )
    Like.create(post: first_post, user: first_user )

    expect(first_post.comments_counter).to eq(1)
    expect(first_post.likes_counter).to eq(1)
  end

end
