class CreateEmergencyDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_devices do |t|
      t.float :latitude
      t.float :longitude
      t.integer :vehicle_type
      t.timestamps
    end
  end
end
