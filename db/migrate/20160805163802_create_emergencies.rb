class CreateEmergencies < ActiveRecord::Migration[5.0]
  def change
    create_table :emergencies do |t|
      t.integer :pet_owner_id, index: true, foreign_key: true
      t.integer :firestation_id, index: true, foreign_key: true
      t.string :status
      t.timestamps
    end
  end
end
