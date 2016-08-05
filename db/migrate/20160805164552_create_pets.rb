class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :photo_url
      t.references :users, index: true, foreign_key: true
      t.timestamps
    end
  end
end
