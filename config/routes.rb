Rails.application.routes.draw do
  namespace :worker do
    get 'genres/index'
    get 'genres/edit'
  end
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
  # 顧客用
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
end