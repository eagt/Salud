class Appointment < ActiveRecord::Base
  belongs_to :clinic

  has_many :assaignments
  has_many :professionals, through: :assaignments

  
  accepts_nested_attributes_for :assaignments

  validates :@current_user_id, presence: true
end
