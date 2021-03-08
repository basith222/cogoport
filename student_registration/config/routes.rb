Rails.application.routes.draw do
  
 get'students/new'
 root 'students#new'
 patch '/student/:id', to: 'students#update', as: 'update_student'
 get 'get_student', to: 'students#get_student', as: 'get_student_url'
 resources :students 
  
end
