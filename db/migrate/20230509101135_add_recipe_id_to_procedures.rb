class AddRecipeIdToProcedures < ActiveRecord::Migration[6.1]
  def change
    add_reference :procedures, :recipe, null: false, foreign_key: true
  end
end
