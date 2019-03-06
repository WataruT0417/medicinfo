class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.string :name, :limit => 100
      t.text :title
      t.string :code, :limit => 20
      t.timestamp :reported_at
      t.timestamps
    end
  end
end
