# frozen_string_literal: true

class ChangeTypeContentInPostComment < ActiveRecord::Migration[7.1]
  def change
    change_column :post_comments, :content, :text # rubocop:disable Rails/ReversibleMigration
  end
end
