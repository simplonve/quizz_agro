class Question < ActiveRecord::Base
	def interrogation(good_entreprise)
		if self.question_type == "geoentreprise" 
			self.text + good_entreprise.city + ' ?'
		else
			self.text + good_entreprise.name + ' ?'
		end
	end

	def self.next_link(question_number)
		if question_number.to_i + 1 > 5
			"/result"
		else 
			(question_number.to_i + 1).to_s
		end 
	end
end
