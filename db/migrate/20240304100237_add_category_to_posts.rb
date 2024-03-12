# frozen_string_literal: true

class AddCategoryToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :category, null: false, foreign_key: true # rubocop:disable Rails/NotNullColumn
  end
end
