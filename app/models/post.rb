class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', inverse_of: :posts
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def top_comments
    comments.order(created_at: :desc).limit(5)
  end
end
