class CreateLineCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :line_commands do |t|
      t.float :price
      t.integer :quantity
      t.references :command, index: true
      t.references :product, index: true
      t.timestamps
    end
  end
end
