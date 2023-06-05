Rails.application.routes.draw do

  root to: 'worker/homes#top'
    #会員一覧
  get '/admin/workers' => 'admin/workers#index'
  get '/admin/workers/:id' => 'admin/workers#show' ,as: 'admin_worker'
  patch '/admin/workers/:id' => 'admin/workers#update', as: 'admin_worker_update'
  get "worker/search" => "worker/searches#search"
  namespace :worker do
    resources :workers, only: [:index,:show,:edit,:update,]
      resources :genres
        resources :recipes do
          resources  :points, only: [:create,:destroy]
        end
        resources :ideas do
          resources :comments, only: [:create,:destroy]
        end
  end
  put "/worker/:id/hide" => "admin/workers#hide", as: 'worker_hide'
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
    post 'workers/guest_sign_in', to: 'worker/sessions#guest_sign_in'
  end

end