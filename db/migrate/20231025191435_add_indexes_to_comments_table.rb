class AddIndexesToCommentsTable < ActiveRecord::Migration[7.1]
  def change
    unless index_exists?(:comments, :user_id)
      add_index :comments, :user_id
    end

    unless index_exists?(:comments, :post_id)
      add_index :comments, :post_id
    end
  end
end
