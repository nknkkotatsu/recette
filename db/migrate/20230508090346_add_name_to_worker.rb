class AddNameToWorker < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :name, :string
  end
end
