class DestroyColumnsToMedicines < ActiveRecord::Migration[5.2]
  def change
    remove_column :medicines, :code
    remove_column :medicines, :approval
  end
end
