class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :address
      t.integer :unit_number
      t.boolean :firestation
      t.timestamps
    end
  end
end
