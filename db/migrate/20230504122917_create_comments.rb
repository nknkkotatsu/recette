class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.integer :worker_id, null: false
      t.integer :idea_id, null: false
      t.timestamps
    end
  end
end
