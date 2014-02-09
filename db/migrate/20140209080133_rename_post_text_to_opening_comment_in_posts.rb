class RenamePostTextToOpeningCommentInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :post_text, :lead_comment
  end
end
