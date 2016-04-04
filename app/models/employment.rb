class Employment < ActiveRecord::Base
  belongs_to :professional
  belongs_to :clinic
end
