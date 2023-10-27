class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: 'author_id'
  has_many :likes

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def top_posts
    posts.order(created_at: :desc).limit(3)
  end
end
