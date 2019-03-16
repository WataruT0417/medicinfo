class AddColumnsToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :request_staff, :string, :limit => 20
    add_column :medicines, :detail, :string
    add_column :medicines, :source, :string
    add_column :medicines, :report_staff, :string, :limit => 20
  end
end
