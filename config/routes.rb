Rails.application.routes.draw do
 root 'questions#index'
 get 'questions/:id' => 'questions#question'

 get 'result' => 'questions#result'
end
