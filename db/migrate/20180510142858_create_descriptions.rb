class CreateDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :descriptions do |t|
      t.text :description
      t.string :language
      t.references :product , index: true
      t.timestamps
    end
  end
end
