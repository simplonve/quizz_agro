class QuestionsController < ApplicationController
	def new_question
		end? ? (@next = "/result") : (@next = next_question_int.to_s)
		@question = Question.find(params[:id])
		@answers = Answer.where(id_question: params[:id]).take
		render 'question'
	end

	def next_question_int
		params[:id].to_i + 1
	end

	def nb_question
		Question.all.length + 1
	end

	def end?
		next_question_int >= nb_question
	end

end
