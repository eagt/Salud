class Professional < ActiveRecord::Base

	has_many :employments
	has_many :clinics, through: :employments

	has_many :assaignments
	has_many :appointments, through: :assaignments

	has_many :client_professionals
	has_many :clients, through: :client_professionals

	#accepts_nested_attributes_for :assaignments, :employments


end
