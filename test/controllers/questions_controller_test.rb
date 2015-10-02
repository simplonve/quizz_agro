require '../test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "question" do
    question = Question.first

    get :question, id: question.id
    assert :success
    assert assigns(:good_answer)
    assert assigns(:interro)
    assert_equal 4, assigns(:choices).length
  end
end

