class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :producer
      t.integer :quantity
      t.timestamps
    end
  end
end
