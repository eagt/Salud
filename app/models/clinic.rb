class Clinic < ActiveRecord::Base
	has_many :appointments
	
	has_many :employments
	has_many :professionals, through: :employments
end
