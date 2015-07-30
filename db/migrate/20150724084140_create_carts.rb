class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.string :mail, null: false
      t.string :name, null: false
      t.integer :total_price ,null: false
      t.text :address, null: false
      t.string :status

      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
