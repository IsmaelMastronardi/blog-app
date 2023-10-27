require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a name" do
    first_user = User.new(name: '', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(first_user).not_to be_valid
  end

  it "is valid without a name" do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(first_user).to be_valid
  end

  it "gets the first 3 posts" do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'post 1', text: 'This is my first post')
    second_post = Post.create(author: first_user, title: 'post 2', text: 'This is my second post')
    third_post = Post.create(author: first_user, title: 'post 3', text: 'This is my third post')
    fourth_post = Post.create(author: first_user, title: 'post 4', text: 'This is my fourth post')
    fifth_post = Post.create(author: first_user, title: 'post 5', text: 'This is my fifth post')
    result =  first_user.top_posts
    puts result.class
    expect(first_user.top_posts).to eq([fifth_post, fourth_post, third_post])
  end

  it "gets the first 3 posts" do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'post 1', text: 'This is my first post')
    second_post = Post.create(author: first_user, title: 'post 2', text: 'This is my second post')
    third_post = Post.create(author: first_user, title: 'post 3', text: 'This is my third post')
    fourth_post = Post.create(author: first_user, title: 'post 4', text: 'This is my fourth post')
    fifth_post = Post.create(author: first_user, title: 'post 5', text: 'This is my fifth post')
    expect(first_user.post_counter).to eq(5)
  end

end
