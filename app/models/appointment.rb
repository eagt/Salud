class Appointment < ActiveRecord::Base
  belongs_to :clinic

  has_many :assignments
  has_many :professionals, through: :assaigments

  # Parents accept nested attributes
  accepts_nested_attributes_for :assignments
end
