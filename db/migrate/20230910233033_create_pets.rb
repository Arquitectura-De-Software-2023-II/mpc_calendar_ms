class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :pet_id
      t.string :name
      t.string :breed

      t.timestamps
    end
  end
end