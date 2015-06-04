Rails.application.routes.draw do
  resources :students
  resources :courses
  resources :classrooms

  root "classrooms#index"

end
