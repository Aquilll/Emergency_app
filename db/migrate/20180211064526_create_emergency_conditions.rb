class CreateEmergencyConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_conditions do |t|
      t.integer :emergency_type
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :landmark
      t.string :pincode
      t.boolean :is_cancelled, :default => false
      t.integer :status, :default => 1
      t.datetime :accepted_at

      t.timestamps
    end
  end
end