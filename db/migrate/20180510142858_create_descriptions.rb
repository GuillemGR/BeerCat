class CreateDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :descriptions do |t|
      t.text :description
      t.references :language , index: true
      t.references :product , index: true
      t.timestamps
    end
  end
end
