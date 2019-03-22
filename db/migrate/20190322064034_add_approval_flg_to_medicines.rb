class AddApprovalFlgToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :approval_flg, :boolean, default: false
    add_column :doubts, :approval_flg, :boolean, default: false
    add_column :reactions, :approval_flg, :boolean, default: false
  end
end
