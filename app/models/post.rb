class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', inverse_of: :posts
  has_many :comments
  has_many :likes

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def top_comments
    comments.order(created_at: :asc).limit(5)
  end
end
