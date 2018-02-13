class EmergencyDevice < ApplicationRecord
	enum vehicle_type: {ambulance: 1, fire: 2, police: 3, others: 4}
end
