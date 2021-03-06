class CreateMigrantShelters < ActiveRecord::Migration[6.1]
  def change
    create_table :migrant_shelters do |t|
      t.belongs_to :migrant, null: false, foreign_key: true
      t.belongs_to :shelter, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
