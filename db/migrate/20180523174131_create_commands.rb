class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.float :price
      t.string :state
      t.references :user, index: true
      t.timestamps
    end
  end
end
