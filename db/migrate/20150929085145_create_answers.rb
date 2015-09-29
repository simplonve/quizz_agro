class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :good_answer
      t.string :bad_answers
      t.integer :id_question
    end
  end
end
