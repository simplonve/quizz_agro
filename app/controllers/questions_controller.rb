class QuestionsController < ApplicationController
	def question
		@question = Question.all.sample(1).first
		@entreprises = select_entreprises
		@good_entreprise = @entreprises.shift
		@interro = interrogation
		@good_answer = good_answer
		@choices = choices.shuffle!
		next_link
	end

	def interrogation
		@question.text + question_dynamic + ' ?'
	end

	def question_type
		@question.question_type
	end

	def question_dynamic
		question_type == "geoentreprise" ? @good_entreprise.city : @good_entreprise.name
	end

	def entreprises
		Entreprise.all.sample(4)
	end

	def entreprises_avec_employes
		Entreprise.where("employees != ?", "n.d.").sample(4)
	end

	def entreprises_avec_ca
		Entreprise.where("ca != ?", "n.d.").sample(4)
	end

	def select_entreprises
		case question_type
		when "employes"
			entreprises_avec_employes
		when "ca"
			entreprises_avec_ca
		else
			entreprises
		end
	end

	def good_answer
		answer(@good_entreprise)
	end

	def bad_answers
		bad_answers = []
		@entreprises.each do |entreprise|
			bad_answers << answer(entreprise)
		end
		bad_answers
	end

	def answer(entreprise)
		case @question.question_type
		when "geoville"
			entreprise.city
		when "activite"
			entreprise.activity
		when "employes"
			entreprise.employees
		when "ca"
			entreprise.ca
		else
			entreprise.name
		end
	end

	def choices
		bad_answers + [good_answer]
	end

	def next_question_int
		params[:id].to_i + 1
	end

	def end?
		next_question_int > Question.all.length
	end

	def next_link
		end? ? (@next = "/result") : (@next = next_question_int.to_s)
	end

end
