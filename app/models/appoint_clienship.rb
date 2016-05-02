class AppointClienship < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :client
end
