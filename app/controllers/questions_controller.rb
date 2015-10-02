class QuestionsController < ApplicationController
	def question
		@question = Question.all.sample(1).first
		@entreprises = Entreprise.select_entreprises(@question)
		@good_entreprise = @entreprises.shift
		@interro = @question.interrogation(@good_entreprise)
		@good_answer = answer(@good_entreprise)
		@choices = choices.shuffle!
		next_link
	end

	def choices
		bad_answers << @good_answer
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
