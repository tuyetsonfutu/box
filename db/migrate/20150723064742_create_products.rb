class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 3000, null: false
      t.string :image,limit: 1000, null: false
      t.integer :category_id
      t.integer :price, null: false
      t.text :description
      t.timestamps null: false
    end
  end
end