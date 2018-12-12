class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :price, precision: 40, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
