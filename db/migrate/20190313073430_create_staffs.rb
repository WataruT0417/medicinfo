class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name, :limit => 100
      t.timestamps
    end
  end
end
