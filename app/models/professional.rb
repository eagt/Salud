class Professional < ActiveRecord::Base

	has_many :employments
	has_many :clinics, through: :employments

	has_many :assaigments
	has_many :appointments, through: :assaigments

	accepts_nested_attributes_for :assaigments, :employments


end
