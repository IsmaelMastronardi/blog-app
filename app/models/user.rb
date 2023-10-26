class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: 'author_id'
  has_many :likes

  def all_comments
    comments.order(created_at: :asc).limit(3)
  end
end
