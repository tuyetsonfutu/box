class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :cart_id, null: false
      t.integer :product_id, null: false
      t.integer :price, null: false
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
