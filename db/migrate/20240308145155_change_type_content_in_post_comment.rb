# frozen_string_literal: true

class ChangeTypeContentInPostComment < ActiveRecord::Migration[7.1]
  def up
    change_column :post_comments, :content, :text
  end

  def down
    change_column :post_comments, :content, :string
  end
end
