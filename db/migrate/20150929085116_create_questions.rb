class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :question_type
      t.string :good_answer, default: ""
      t.string :bad_answers, default: ""
    end
  end
end
