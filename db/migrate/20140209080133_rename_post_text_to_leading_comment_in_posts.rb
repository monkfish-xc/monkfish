class RenamePostTextToLeadingCommentInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :post_text, :leading_comment
  end
end
