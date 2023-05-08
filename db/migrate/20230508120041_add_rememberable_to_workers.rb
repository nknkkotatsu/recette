class AddRememberableToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :remember_created_at, :datetime
    add_index :workers, :remember_created_at
  end
end
