class AddUserToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true # rubocop:disable Rails/NotNullColumn
  end
end
