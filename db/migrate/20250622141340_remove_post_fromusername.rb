class RemovePostFromusername < ActiveRecord::Migration[8.0]
  def change
        remove_column :posts, :username, :string
  end
end
