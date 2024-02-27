class AddNameToMarks < ActiveRecord::Migration[7.1]
  def change
    add_column :marks, :name, :string
  end
end
