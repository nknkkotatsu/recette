class AddIsDeletedToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :is_deleted, :boolean, default: false
  end
end
