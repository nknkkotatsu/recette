Rails.application.routes.draw do

  root to: "worker/recipes#index"
  
    #会員一覧
  get '/admin/workers' => 'admin/workers#index'
  get '/admin/workers/:id' => 'admin/workers#show' ,as: 'admin_worker'
  patch '/admin/workers/:id' => 'admin/workers#update', as: 'admin_worker_update'
  
  namespace :worker do
    get 'genres/index'
    #get 'genres/edit'
  end
  post '/worker/genres' => 'worker/genres#create', as: 'worker_genres_create'
  patch '/worker/genres/:id' => 'worker/genres#update', as: 'worker_genres_update'
  get '/worker/genres/:id/edit' => 'worker/genres#edit', as: 'worker_genres_edit'

  namespace :worker do
    get 'ideas/new'
    get 'ideas/index'
    get 'ideas/show'
    get 'ideas/edit'
  end
  namespace :worker do
    #resources :recipes
     get 'recipes/new'
     get 'recipes/index'
     get 'recipes/show'
     get 'recipes/edit'
  end
  # 会員用
  # URL /workers/sign_in ...
  devise_for :workers,skip: [:passwords], controllers: {
    registrations: "worker/registrations",
    sessions: 'worker/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # ゲストユーザー用
  devise_scope :worker do
    post 'workers/guest_sign_in', to: 'workers/sessions#guest_sign_in'
  end

end