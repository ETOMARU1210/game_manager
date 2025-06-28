class AddReferencesToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :project, null: false, foreign_key: true
  end
end
