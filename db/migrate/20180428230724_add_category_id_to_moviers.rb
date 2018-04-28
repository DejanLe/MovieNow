class AddCategoryIdToMoviers < ActiveRecord::Migration[5.1]
  def change
    add_column :moviers, :category_id, :integer
  end
end
