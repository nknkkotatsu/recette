class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :point, null: false
      t.integer :worker_id, null: false
      t.integer :recipe_id, null: false
      t.timestamps
    end
  end
end
