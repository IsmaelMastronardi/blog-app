class AddIndexesToLikesTable < ActiveRecord::Migration[7.1]
  def change
    unless index_exists?(:likes, :user_id)
      add_index :likes, :user_id
    end
    unless index_exists?(:likes, :post_id)
      add_index :likes, :post_id
    end
  end
end
