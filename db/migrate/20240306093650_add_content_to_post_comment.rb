class AddContentToPostComment < ActiveRecord::Migration[7.1]
  def change
    add_column :post_comments, :content, :string
    add_index :post_comments, :content
  end
end
