class AddApprovalToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :approval, :string, :limit => 20
  end
end
