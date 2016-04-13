class Assaignment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :professional

   accepts_nested_attributes_for :professional
end
