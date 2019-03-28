class ChangeDatatypeDetailToDatatable < ActiveRecord::Migration[5.2]
  def change
    change_column :medicines, :detail, :text
    change_column :reactions, :detail, :text
    change_column :doubts, :detail, :text
  end
end
