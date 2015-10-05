class Entreprise < ActiveRecord::Base
	def self.pick(question)
		case question.question_type
		when "employes"
			entreprise = self.where("employees != ?", "n.d.").sample
		when "ca"
			entreprise = self.where("ca != ?", "n.d.").sample
		else
			entreprise = self.all.sample
		end
	end

	def self.build_choices_array(all_bad_answers, good_answer)
		answers = all_bad_answers.sample(3)
		answers << good_answer
	end

	def self.choices(type, entreprise)

		case type
		when "employes"
			answer = entreprise.employees
			all_bad_answers = Entreprise.all.map(&:employees).uniq - [answer]
			build_choices_array(all_bad_answers, answer)
		when "geoville"
			answer = entreprise.city
			all_bad_answers = Entreprise.all.map(&:city).uniq - [answer]
			build_choices_array(all_bad_answers, answer)
		when "activite"
			answer = entreprise.activity
			all_bad_answers = Entreprise.all.map(&:activity).uniq - [answer]
			build_choices_array(all_bad_answers, answer)
		when "ca"
			answer = entreprise.ca
			all_bad_answers = Entreprise.all.map(&:ca).uniq - [answer]
			build_choices_array(all_bad_answers, answer)
		else
			answer = entreprise.name
			all_bad_answers = Entreprise.all.map(&:name).uniq - [answer]
			build_choices_array(all_bad_answers, answer)
		end
	end
end
