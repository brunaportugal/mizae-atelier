class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :availability
      t.string :category
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
