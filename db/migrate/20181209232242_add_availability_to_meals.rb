class AddAvailabilityToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :availability, :boolean
  end
end
