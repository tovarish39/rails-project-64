# frozen_string_literal: true

class AddIndexToColumnCategories < ActiveRecord::Migration[7.1]
  def change
    add_index :categories, :name
  end
end
