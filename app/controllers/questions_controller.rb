class QuestionsController < ApplicationController
	def new_question
		@next_question = next_question_int.to_s
		if next_question_int > nb_question 
			render 'result'
		else
			next_question_int == nb_question ? (@next_question_text = "Fin") : (@next_question_text = "Question suivante")
			@question = Question.find(params[:id])
			@answers = Answer.where(id_question: params[:id]).take
			render 'question'
		end
	end

	def next_question_int
		params[:id].to_i + 1
	end

	def nb_question
		Question.all.length + 1
	end

	
end
