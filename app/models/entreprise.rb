class Entreprise < ActiveRecord::Base
	def self.select_entreprises(question)
		case question.question_type
		when "employes"
			self.where("employees != ?", "n.d.").sample(4)
		when "ca"
			self.where("ca != ?", "n.d.").sample(4)
		else
			self.all.sample(4)
		end
	end
end
