class RemoveAnswers < ActiveRecord::Migration
  def change
    drop_table :answers
  end
end
