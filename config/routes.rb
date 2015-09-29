Rails.application.routes.draw do
 root 'entreprises#index'
 get 'questions/:id' => 'questions#new_question'

 get 'result' => 'questions#result'
end
