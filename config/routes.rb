Rails.application.routes.draw do
  root "students#index"
  get '/students', to: 'students#index', as: 'students'
  get '/students/edit', to: 'students#edit', as: 'edit_student'
  patch '/students', to: 'students#update', as: 'student'
end
