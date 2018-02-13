class CreateEmergency < ActiveRecord::Migration[5.1]
  def change
    create_table :emergencies do |t|
    	t.integer :emergency_type
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :landmark
      t.string :pincode

      t.timestamps
    end
  end
end
