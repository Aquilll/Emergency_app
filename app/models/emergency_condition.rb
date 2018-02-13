class EmergencyCondition < ApplicationRecord
has_one :emergency_location
accepts_nested_attributes_for :emergency_location
enum emergency_type: {accident: 1, fire: 2, theft: 3, others: 4}
enum status: {pending: 1, accepted: 2, cancelled: 3}
number_regex = /\d[0-9]\)*\z/

validates_format_of :phone_number, :with =>  number_regex, :message => "Only positive number without spaces are allowed"
	def pending
		self.pending?
	end

	def accepted_time

	end

	def active_emergency?
		self.accepted_at.nil? and !self.accepted?
	end

	def self.active_emergencies
		EmergencyCondition.all
	end

	def self.accepted_emergencies
		EmergencyCondition.where(status: "accepted")
	end

end