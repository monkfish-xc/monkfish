class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :title
      t.string :post_text
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at] # multi-key index
  end
end
