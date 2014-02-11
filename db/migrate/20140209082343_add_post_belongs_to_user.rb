class AddPostBelongsToUser < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id
    add_reference :posts, :user
  end
end
