class QuestionsController < ApplicationController
	def new_question
		@question = Question.find(params[:id])
		answers
		next_link
		render 'question'
	end

	def next_question_int
		params[:id].to_i + 1
	end

	def nb_question
		Question.all.length + 1
	end

	def obj_answer
		@answers = Answer.where(id_question: params[:id]).take
	end

	def answers
		@arr_answers = []
		@arr_answers.push(obj_answer.good_answer, obj_answer.bad_answers).shuffle!
	end

	def end?
		next_question_int >= nb_question
	end

	def next_link
		end? ? (@next = "/result") : (@next = next_question_int.to_s)
	end

end
