class Appointment < ActiveRecord::Base
  belongs_to :clinic

  has_many :assaigments
  has_many :professionals, through: :assaigments
end
