class Assaignment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :professional


  accepts_nested_attributes_for :professional

  validates :professional_id, presence: true, numericality: { only_integer: true }
	
  #validates_uniqueness_of :professional_id	  #:uniqueness => {:message=>"Cannot repeat the professional_id"}

#validates_associated :professional
#validate :prof_arr
#validate :set_professional

private






 # _arr(professional_id = :professional_id)
  # 	prof = Array.new()
  # 	prof.push(:professional_id)
  # 	if prof.include? :professional_id
  # 		print "Can't be added"
  # 	else prof.push(:professional_id)
  # 	end
  # end

# Method so verify that a professional can't be entered twice
  # def pro_id
  # 	#id = @current_user.id
  # 	c = Clinic.find(1)
  # 	p = c.professionals.ids

  # 		if p.include? professional_id
  # 			print " Can be added"
  # 		else print " No part of this clinic"
		# end
  # end
  


 #  def validate_professional_id
 #  	#professionals = clinic.professionals
 #  	errors.add(:professional_id, "is invalid") unless Professional.exists?(self.professional_id)
 # end

end
