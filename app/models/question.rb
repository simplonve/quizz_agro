class Question < ActiveRecord::Base
	def interrogation(good_entreprise)
		if self.question_type == "geoentreprise" 
			self.text + good_entreprise.city + ' ?'
		else
			self.text + good_entreprise.name + ' ?'
		end
	end
end
