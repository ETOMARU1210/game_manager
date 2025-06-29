class AddColumnPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :reply_to, :integer, null: true
  end
end
