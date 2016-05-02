class Appointment < ActiveRecord::Base
  
  belongs_to :clinic
  
  belongs_to :client 

  has_many :assaignments
  has_many :professionals, through: :assaignments



  accepts_nested_attributes_for :assaignments

  validate :set_professional   #, :if clinic_id > 0  Para 
  #validate :set_uniq_professional

private
	
	def set_professional
    if clinic_id
  		clinic = Clinic.find(clinic_id)
      clinic_pro = clinic.professionals.ids
      self.assaignments.each do |appointment_assignment|
        if !clinic_pro.include? appointment_assignment.professional_id
  	      raise 
        end
  	 	end
   end
	rescue Exception => e
		raise e,"No employment relationship for this professional "
  end

  # def set_uniq_professional
  # 	clini = Clinic.find(clinic_id)
  #   clini_pros = clini.professionals.ids
  #   h = Hash.new(0)
  #   clini_pros.each do |co_pro| 
  #   	h[co_pro] += 1
  #   end
  # end

# THIS WILL SHOW AN ARRAY WITH UNIQUE VALUES
  # c = Clinic.find(1)
  # cp = c.professionals.ids
  # cp.push(1, 3, 5)
  # output = cp.uniq { |x| x }

  # def set_uniq_professional
  # 	clini = Clinic.find(clinic_id)
  # 	clini_pros = clini.professionals.ids
  # 	    clini_pros.uniq { |x| x }	 
  # end
def set_uniq_professional
	clini = Clinic.find(clinic_id)
  clini_pros = clini.professionals.ids
  professional_ids = []
  #@professional_ids << Assaignment.professional_id
    unless clini_pros.include?(professional_ids)
  	puts "can be added"
	  end
end

end