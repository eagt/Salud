class Client < ActiveRecord::Base
  belongs_to :clinic
  has_many :appointments

  has_many :client_professionals
  has_many :clients, through: :client_professionals



end
