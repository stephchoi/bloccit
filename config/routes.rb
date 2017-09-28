Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/new'

  get 'advertisements/edit'

  get 'advertisements/show'

  resources :posts
  resources :advertisements
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
end
