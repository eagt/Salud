class ClientProfessional < ActiveRecord::Base
  belongs_to :professional
  belongs_to :client
end
