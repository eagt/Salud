class Professional < ActiveRecord::Base

	has_many :employments
	has_many :clinics, through: :employments

	has_many :assaignments
	has_many :appointments, through: :assaignments

	accepts_nested_attributes_for :assaignments, :employments


end
