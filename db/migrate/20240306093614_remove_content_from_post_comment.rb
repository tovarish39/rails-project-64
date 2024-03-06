class RemoveContentFromPostComment < ActiveRecord::Migration[7.1]
  def change
    remove_column :post_comments, :content, :string
  end
end
