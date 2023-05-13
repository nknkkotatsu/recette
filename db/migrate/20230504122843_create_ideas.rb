class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :name, null: false
      t.text :ingredient, null: false
      t.string :allergen, null: false
      t.text :explanation, null: false
      t.string :remarks, null: false
      t.string :price, null: false
      t.integer :worker_id, null: false
      t.timestamps
    end
  end
end
