class QuestionsController < ApplicationController
	def question
		@question = Question.all.sample(1).first
		@entreprise = Entreprise.pick(@question)
		@interro = @question.interrogation(@entreprise)

		@choices = Entreprise.choices(@question.question_type, @entreprise)
		@good_answer = @choices.last		
		@next = Question.next_link(params[:id])
	end
end
