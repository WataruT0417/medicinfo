class ChangeDataReportedAtToMedicine < ActiveRecord::Migration[5.2]
  def change
    change_column :medicines, :reported_at, :date
  end
end
