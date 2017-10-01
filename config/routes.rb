Rails.application.routes.draw do
  get 'sponsered_posts/show'

  get 'sponsered_posts/new'

  get 'sponsered_posts/edit'

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsered_posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
end
