class AddIndexesToPostsTable < ActiveRecord::Migration[7.1]
  def change
    add_index :posts, :authors_id
  end
end
