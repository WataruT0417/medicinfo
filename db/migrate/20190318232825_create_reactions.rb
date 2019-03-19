class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.string :name, :limit => 100
      t.string :title
      t.date :reported_at
      t.string :doctor, :limit => 100
      t.string :patient_id, :limit => 10
      t.string :patient_name, :limit => 100
      t.string :detail
      t.string :report_staff, :limit => 100
      t.timestamps
    end
  end
end
