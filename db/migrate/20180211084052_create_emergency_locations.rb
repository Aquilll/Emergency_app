class CreateEmergencyLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_locations do |t|
      t.float :latitude
      t.float :longitude
      t.belongs_to :emergency_condition, foreign_key: true, null: false, index: true
      t.references
      t.timestamps
    end
  end
end
