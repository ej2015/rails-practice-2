class AddCategoryToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :category, :integer, null: false, default: 0
    add_index :posts, :category
  end
end
