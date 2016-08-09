class CreateEmergencies < ActiveRecord::Migration[5.0]
  def change
    create_table :emergencies do |t|
      t.references :user_id, index: true, foreign_key: true
      t.references :firestation_id, index: true, foreign_key: true
      t.string :address
      t.string :user_status
      t.string :firestation_status
      t.timestamps
    end
  end
end
