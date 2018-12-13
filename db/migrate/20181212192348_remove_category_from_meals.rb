class RemoveCategoryFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :category, :string
  end
end
