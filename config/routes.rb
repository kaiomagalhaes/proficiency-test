Rails.application.routes.draw do
  resources :students
  resources :courses
  resources :classrooms
  resources :grades

  root 'classrooms#index'
end
