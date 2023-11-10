class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', inverse_of: :posts
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  self.per_page = 5

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def top_comments
    comments.order(created_at: :desc).limit(5)
  end

  def as_json(options = {})
    super({ except: %i[created_at updated_at] }.merge(options))
  end
end
